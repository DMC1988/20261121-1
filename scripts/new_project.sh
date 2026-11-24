#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 2 ]; then
  echo "Usage: $0 <project-name> <destination-dir>"
  exit 1
fi
PROJECT_NAME="$1"
DEST_DIR="$2"
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NEW_PROJECT_PATH="${DEST_DIR%/}/${PROJECT_NAME}"
if [ -e "$NEW_PROJECT_PATH" ]; then
  echo "Error: $NEW_PROJECT_PATH already exists."
  exit 1
fi
echo "Creating $NEW_PROJECT_PATH from template at $TEMPLATE_DIR ..."
mkdir -p "$NEW_PROJECT_PATH"
if command -v rsync >/dev/null 2>&1; then
  rsync -a --exclude '.git' "$TEMPLATE_DIR"/ "$NEW_PROJECT_PATH"/
else
  cp -a "$TEMPLATE_DIR"/. "$NEW_PROJECT_PATH"/
  rm -rf "$NEW_PROJECT_PATH/.git"
fi
if command -v sed >/dev/null 2>&1; then
  sed -i.bak "s/\[NOMBRE DEL PROYECTO\]/${PROJECT_NAME}/g" "$NEW_PROJECT_PATH/README.md" "$NEW_PROJECT_PATH/CHANGELOG.md"
  rm -f "$NEW_PROJECT_PATH/README.md.bak" "$NEW_PROJECT_PATH/CHANGELOG.md.bak"
fi
cd "$NEW_PROJECT_PATH"
git init -q
git lfs install --local >/dev/null 2>&1 || echo "Warning: git-lfs not installed."
git add .
git commit -q -m "chore: scaffold project from NYQUEN LABS KiCad template"
git branch -M main
echo "Done. Project created at: $NEW_PROJECT_PATH"
