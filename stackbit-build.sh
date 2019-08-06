#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://797a48d3.ngrok.io/pull/5d498e060a670864846cf1b8 
fi
jekyll build
./inject-netlify-identity-widget.js _site
