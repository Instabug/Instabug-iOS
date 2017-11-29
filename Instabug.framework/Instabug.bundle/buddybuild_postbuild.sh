
# Copyright 2017 Instabug, Inc. All rights reserved.
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
# SCRIPT_SRC=$(find "$PROJECT_DIR" -name 'buddybuild_postbuild.sh' | head -1)
# if [ ! "${SCRIPT_SRC}" ]; then
#   echo "Instabug: err: script not found. Make sure that you're including Instabug.bundle in your project directory"
#   exit 1
# fi
# source "${SCRIPT_SRC}"
# --- INVOCATION SCRIPT END ---

echo "Instabug: Test"

echo "Instabug: Started uploading dSYM"

# Check for simulator builds
if [ "$EFFECTIVE_PLATFORM_NAME" == "-iphonesimulator" ]; then
if [ "${SKIP_SIMULATOR_BUILDS}" ] && [ "${SKIP_SIMULATOR_BUILDS}" -eq 1 ]; then
echo "Instabug: Skipping simulator build"
exit 0
fi
fi

# Check to make sure the app token exists
if [ ! "${APP_TOKEN}" ]; then
APP_TOKEN=$(grep -r 'Instabug startWithToken:@\"[0-9a-zA-Z]*\"' ./ -m 1 | grep -o '\"[0-9a-zA-Z]*\"' | cut -d "\"" -f 2)
fi

if [ ! "${APP_TOKEN}" ]; then
APP_TOKEN=$(grep -r 'Instabug.startWithToken(\"[0-9a-zA-Z]*\"' ./ -m 1 | grep -o '\"[0-9a-zA-Z]*\"' | cut -d "\"" -f 2)
fi

if [ ! "${APP_TOKEN}" ] || [ -z "${APP_TOKEN}" ];then
echo "Instabug: err: APP_TOKEN not found. Make sure you've added the SDK initialization line [Instabug startWithToken: invocationEvent:]"
exit 1
fi
echo "Instabug: found APP_TOKEN=${APP_TOKEN}"

# Check internet connection
if [ "`curl -s https://api.instabug.com | grep status | grep -c OK`" != "1" ]; then
echo "ERROR connecting to api.instabug.com."
exit 0
fi

# Create temp directory if not exists
CURRENT_USER=$(whoami| tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]')
TEMP_ROOT="/tmp/Instabug-${CURRENT_USER}"
if [ ! -d "${TEMP_ROOT}" ]; then
mkdir "${TEMP_ROOT}"
fi
TEMP_DIRECTORY="${TEMP_ROOT}/$EXECUTABLE_NAME"
if [ ! -d "${TEMP_DIRECTORY}" ]; then
mkdir "${TEMP_DIRECTORY}"
fi

cd $BUDDYBUILD_PRODUCT_DIR
find . -name "*.dSYM" -print | zip -r /tmp/dsyms.zip -@

# Upload dSYM
echo "Instabug: Uploading dSYM file..."
ENDPOINT="https://api.instabug.com/api/sdk/v3/symbols_files"
STATUS=$(curl "${ENDPOINT}" --write-out %{http_code} --silent --output /dev/null -F symbols_file="@/tmp/dsyms.zip" -F application_token="${APP_TOKEN}")
if [ $STATUS -ne 200 ]; then
echo "Instabug: err: dSYM archive not succesfully uploaded."
echo "Instabug: deleting temporary dSYM archive..."
exit 0
fi
