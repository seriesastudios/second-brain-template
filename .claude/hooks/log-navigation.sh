#!/bin/bash
# Log navigation tool calls for optimization analysis

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // .tool_input.pattern // empty' 2>/dev/null)

# Skip if no path or jq unavailable
[ -z "$FILE_PATH" ] && exit 0

SECOND_BRAIN=$(git rev-parse --show-toplevel 2>/dev/null || dirname "$(dirname "$(dirname "$0")")")
LOG_DIR="$SECOND_BRAIN/Claude/Navigation Logs"
TODAY=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

# Strip absolute prefix for readability — try common patterns
REL_PATH="$FILE_PATH"
REL_PATH="${REL_PATH#$SECOND_BRAIN/}"

mkdir -p "$LOG_DIR"
echo "$TIME|$TOOL|$REL_PATH" >> "$LOG_DIR/$TODAY.csv"
exit 0
