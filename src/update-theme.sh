#!/bin/bash

# https://geekdocs.de/usage/getting-started/#option-1-download-pre-build-release-bundle

# Variables
ROOT=$(git rev-parse --show-toplevel)
THEME_PATH="$ROOT/themes/hugo-geekdoc/"

# Clean old theme
echo "Removing old theme"
rm -rf $THEME_PATH

# Download latest release
echo "Downloading latest version of theme"
mkdir -p $THEME_PATH
curl -Ls https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C $THEME_PATH --strip-components=1

# Check for changes
if [[ $(git status --porcelain -- $THEME_PATH) ]]; then
  # Changes
  echo "Theme updated with changes!"
  NEW_VERSION=$(cat $THEME_PATH/VERSION)
  echo "New version: $NEW_VERSION"
else
  echo "No changes detected"
fi
