#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

./scripts/kind-up.sh || true

./services/hello-world/scripts/docker-build.sh && \
    ./services/hello-world/scripts/upload-docker-image-to-kind.sh

./tanka/scripts/install-vendors.sh \
    && ./tanka/scripts/tk-apply.sh
