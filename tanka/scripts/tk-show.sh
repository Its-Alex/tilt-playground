#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

tk show \
    --ext-str "timestamp=$(date +%s)" \
    environments/default \
    --dangerous-allow-redirect
