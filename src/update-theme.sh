#!/bin/bash

# https://geekdocs.de/usage/getting-started/#option-1-download-pre-build-release-bundle

ROOT=$(git rev-parse --show-toplevel)
mkdir -p themes/hugo-geekdoc/
curl -L https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C $ROOT/themes/hugo-geekdoc/ --strip-components=1
