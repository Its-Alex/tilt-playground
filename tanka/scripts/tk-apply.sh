#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

tk apply \
    --auto-approve always \
    --ext-str "timestamp=$(date +%s)" \
    environments/default > /dev/null 2>&1
