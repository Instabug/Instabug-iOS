cd "${ARCHIVE_DSYMS_PATH}"

LOG_FILE="Instabug_dsym_strip_invalid_archs_log.txt"

echo "Instabug: Started post-archiving dsym strip script" >> $LOG_FILE
echo "" >> $LOG_FILE
echo "Path to archive ${ARCHIVE_PATH}" >> $LOG_FILE
echo "Path to dsyms ${ARCHIVE_DSYMS_PATH}" >> $LOG_FILE
echo "" >> $LOG_FILE

binary="${DWARF_DSYM_FOLDER_PATH}/Instabug.framework.dSYM/Contents/Resources/DWARF/Instabug"

echo "Valid architectures: ${VALID_ARCHS}" >> $LOG_FILE
echo "Wanted architectures: ${ARCHS}" >> $LOG_FILE
echo "" >> $LOG_FILE
  
# Get architectures for current file
archs="$(lipo -info "$binary" | rev | cut -d ':' -f1 | rev)"
stripped=""
echo "Retrieved Architectures: $archs" >> $LOG_FILE
echo "" >> $LOG_FILE

# Loop on architectures and strip those that are not in $ARCHS
for arch in $archs; do

  if ! [[ "${ARCHS}" == *"$arch"* ]]; then
    echo "Stripping architecture: $arch" >> $LOG_FILE
    echo "" >> $LOG_FILE

    # Strip non-valid architectures in-place
    output_path="${ARCHIVE_DSYMS_PATH}/Instabug.framework.dSYM/Contents/Resources/DWARF/Instabug"
    lipo -remove "$arch" -output "$output_path" "$output_path"
    stripped="$stripped $arch"
  else
    echo "Architecture $arch was not stripped" >> $LOG_FILE
    echo "" >> $LOG_FILE
  fi

done

if [[ "$stripped" ]]; then
  echo "Stripped $binary of architectures:$stripped" >> $LOG_FILE
  echo "" >> $LOG_FILE
else
  echo "Did not find anything to strip" >> $LOG_FILE
  echo "" >> $LOG_FILE
fi

echo "Instabug: Finished post-archiving dsym strip script" >> $LOG_FILE