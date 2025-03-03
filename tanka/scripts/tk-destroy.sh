#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

tk delete \
    --auto-approve always \
    --ext-str "timestamp=$(date +%s)" \
    environments/default
