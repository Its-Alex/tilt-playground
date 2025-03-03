#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

tk delete \
    --auto-approve always \
    --ext-str "timestamp=$(date +%s)" \
    --ext-str "image=${1:-flask-hello-world:latest}" \
    environments/default
