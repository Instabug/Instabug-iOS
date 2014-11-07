# Copyright 2014 Instabug, Inc. All rights reserved.
#
# Usage:
#   * In the project editor, select your target.
#   * Click "Build Phases" at the top of the project editor.
#   * Click "+" button in the top left corner.
#   * Choose "New Run Script Build Phase."
#   * Uncomment and paste the following script.
#
# --- INVOCATION SCRIPT BEGIN ---
# # SKIP_SIMULATOR_BUILDS=1
# SCRIPT_SRC=$(find "$PROJECT_DIR" -name 'Instabug_dsym_upload.sh' | head -1)
# if [ ! "${SCRIPT_SRC}" ]; then
#   echo "Instabug: err: script not found. Make sure that you're including Instabug.bundle in your project directory"
#   exit 1
# fi
# source "${SCRIPT_SRC}"
# --- INVOCATION SCRIPT END ---

echo "Instabug: Started uploading dSYM"

# Check to make sure the app token exists
if [ ! "${APP_TOKEN}" ]; then
APP_TOKEN=$(grep -r 'Instabug startWithToken:@\"[0-9a-zA-Z]*\"' ./ -m 1 | grep -o '\"[0-9a-zA-Z]*\"' | cut -d "\"" -f 2)
fi

if [ ! "${APP_TOKEN}" ]; then
APP_TOKEN=$(grep -r 'Instabug.startWithToken(\"[0-9a-zA-Z]*\"' ./ -m 1 | grep -o '\"[0-9a-zA-Z]*\"' | cut -d "\"" -f 2)
fi

if [ ! "${APP_TOKEN}" ] || [ -z "${APP_TOKEN}" ];then
  echo "Instabug: err: APP_TOKEN not found. Make sure you've added the SDK initialization line [Instabug startWithToken: captureSource: invocationEvent:]"
  exit 1
fi
echo "Instabug: found APP_TOKEN=${APP_TOKEN}"

# Check internet connection
if [ ! "`ping -c 1 instabug.com`" ]; then
  exit 0
fi

# Check for simulator builds
if [ "$EFFECTIVE_PLATFORM_NAME" == "-iphonesimulator" ]; then
  if [ "${SKIP_SIMULATOR_BUILDS}" ] && [ "${SKIP_SIMULATOR_BUILDS}" -eq 1 ]; then
    echo "Instabug: Skipping simulator build"
    exit 0
  fi
fi

# Create a temp directory
TEMP_ROOT=$(mktemp -d /tmp/Instabug.XXXXXX)

if [ "$?" -ne 0 ]; then
    echo "Instabug: Failed to create temporary directory"
    exit 1
fi

function cleanUp() {
    rm -rf $TEMP_ROOT;
}

trap cleanUp EXIT

TEMP_DIRECTORY="${TEMP_ROOT}/${EXECUTABLE_NAME}"

mkdir -p $TEMP_DIRECTORY

if [ "$?" -ne 0 ]; then
    echo "Instabug: Failed to create temporary directory in ${TEMP_DIRECTORY}"
    exit 1
fi

# Check dSYM file
DSYM_PATH=${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}
DSYM_UUIDs=$(dwarfdump --uuid ${DSYM_PATH} | cut -d' ' -f2)

# Check if UUIDs exists
DSYM_UUIDs_PATH="${TEMP_DIRECTORY}/UUIDs.dat"
if [ -f "${DSYM_UUIDs_PATH}" ]; then
    if grep -Fxq "${DSYM_UUIDs}" "${DSYM_UUIDs_PATH}"; then
        exit 0
    fi
fi

# Create dSYM .zip file
DSYM_PATH_ZIP="${TEMP_DIRECTORY}/$DWARF_DSYM_FILE_NAME.zip"
if [ ! -d "$DSYM_PATH" ]; then
  echo "Instabug: err: dSYM not found: ${DSYM_PATH}"
  exit 0
fi
echo "Instabug: Compressing dSYM file..."
(/usr/bin/zip --recurse-paths --quiet "${DSYM_PATH_ZIP}" "${DSYM_PATH}") || exit 0

# Upload dSYM
echo "Instabug: Uploading dSYM file..."
ENDPOINT="https://www.instabug.com/api/ios/v1/dsym"
STATUS=$(curl "${ENDPOINT}" --write-out %{http_code} --silent --output /dev/null -F dsym=@"${DSYM_PATH_ZIP}" -F token="${APP_TOKEN}")
if [ $STATUS -ne 200 ]; then
  echo "Instabug: err: dSYM archive not succesfully uploaded."
  exit 0
fi

# Save UUIDs
echo "${DSYM_UUIDs}" >> "${DSYM_UUIDs_PATH}"

# Finalize
echo "Instabug: dSYM upload complete."

trap - EXIT
cleanUp
