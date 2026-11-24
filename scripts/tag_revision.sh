#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 2 ]; then
  echo "Usage: $0 <revLabel e.g. revA> \"<message>\""
  exit 1
fi
REV_LABEL="$1"
MESSAGE="$2"
if ! [[ "$REV_LABEL" =~ ^rev[A-Z](\.[0-9]+)?$ ]]; then
  echo "Warning: '$REV_LABEL' doesn't match the expected pattern (revA, revB, revA.1, ...)."
  read -p "Continue anyway? [y/N] " CONFIRM
  [[ "$CONFIRM" =~ ^[Yy]$ ]] || exit 1
fi
if git rev-parse "$REV_LABEL" >/dev/null 2>&1; then
  echo "Error: tag '$REV_LABEL' already exists. Use ${REV_LABEL}.1 for a re-send instead."
  exit 1
fi
if ! git diff-index --quiet HEAD --; then
  echo "Warning: you have uncommitted changes. The tag will point to the last commit."
  read -p "Continue anyway? [y/N] " CONFIRM
  [[ "$CONFIRM" =~ ^[Yy]$ ]] || exit 1
fi
git tag -a "$REV_LABEL" -m "$MESSAGE"
echo "Tagged current commit as '$REV_LABEL'."
echo "Push tags: git push origin main --tags"
