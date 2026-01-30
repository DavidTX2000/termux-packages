#!/bin/bash
# Metadata and validation logic

echo "Current path detected: $(pwd)"
read -p "File name: " fname
read -p "Version: " fver
read -p "Type (apk, game, mod): " ftype
read -p "Description: " fdesc

# Binary ID logic (Random string unless type is mod)
if [ "$ftype" != "mod" ]; then
    vid=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)
    tag="<validate-id=\"$vid\">"
else
    tag="<validate-id=\"non-binary-mod\">"
fi

# Security and file size suggestions
fsize=$(du -kb aether 2>/dev/null | cut -f1 || echo "0")
fdate=$(date +%Y-%m-%d)

cat <<METADATA > "$fname.info"
name="$fname"
version="$fver"
type="$ftype"
description="$fdesc"
file_size="$fsize kb"
date="$fdate"
$tag
METADATA

echo "Metadata file $fname.info created successfully!"
