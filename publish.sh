#!/usr/bin/env bash
set -euo pipefail

make full
ghp-import -n -p -f _build/html
