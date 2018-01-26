cd "${ARCHIVE_DSYMS_PATH}"

echo "Instabug: Started post-archiving dsym strip script"
echo "Instabug: Path to archive ${ARCHIVE_PATH}"
echo "Instabug: Path to dsyms ${ARCHIVE_DSYMS_PATH}"

binary="${DWARF_DSYM_FOLDER_PATH}/Instabug.framework.dSYM/Contents/Resources/DWARF/Instabug"

echo "Instabug: Valid architectures: ${VALID_ARCHS}"
echo "Instabug: Architectures: ${ARCHS}"
  
# Get architectures for current file
archs="$(lipo -info "$binary" | rev | cut -d ':' -f1 | rev)"
stripped=""
echo "Instabug: Instabug's Architectures: $archs"

# Loop on architectures and strip those that are not in $ARCHS
for arch in $archs; do

  if ! [[ "${ARCHS}" == *"$arch"* ]]; then
    echo "Instabug: Stripping architecture: $arch"

    # Strip non-valid architectures in-place
    output_path="${ARCHIVE_DSYMS_PATH}/Instabug.framework.dSYM/Contents/Resources/DWARF/Instabug"
    lipo -remove "$arch" -output "$output_path" "$output_path"
    stripped="$stripped $arch"
  else
    echo "Instabug: Architecture $arch was not stripped"
  fi

done

if [[ "$stripped" ]]; then
    echo "Instabug: Stripped $binary of architectures:$stripped"
else
    echo "Instabug: Did not find anything to strip"
fi

echo "Instabug: Finished post-archiving dsym strip script"