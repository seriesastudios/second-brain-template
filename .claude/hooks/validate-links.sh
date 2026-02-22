#!/bin/bash
# Validate wiki-links in edited content before write

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)
NEW_CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty' 2>/dev/null)

# Skip if no file path or jq unavailable
[ -z "$FILE_PATH" ] && exit 0

SECOND_BRAIN=$(git rev-parse --show-toplevel 2>/dev/null || dirname "$(dirname "$(dirname "$0")")")

# Extract wiki-links from new content
LINKS=$(echo "$NEW_CONTENT" | grep -oE '\[\[[^]]+\]\]' | sed 's/\[\[//g; s/\]\]//g; s/|.*//g')

BROKEN=""
for LINK in $LINKS; do
  # Check if file exists (with or without .md extension)
  if [ ! -f "$SECOND_BRAIN/$LINK" ] && [ ! -f "$SECOND_BRAIN/$LINK.md" ] && [ ! -d "$SECOND_BRAIN/$LINK" ]; then
    BROKEN="$BROKEN\n- $LINK"
  fi
done

if [ -n "$BROKEN" ]; then
  echo "Warning: These wiki-links may be broken:$BROKEN" >&2
  echo '{"systemMessage": "Link validation found potentially broken links. Verify targets exist."}'
fi

exit 0
