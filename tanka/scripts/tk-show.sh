#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

tk show \
    --ext-str "timestamp=$(date +%s)" \
    --ext-str "image=${1:-flask-hello-world:latest}" \
    environments/default \
    --dangerous-allow-redirect
