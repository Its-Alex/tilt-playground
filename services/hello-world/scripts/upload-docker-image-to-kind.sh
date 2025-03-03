#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

kind load docker-image flask-hello-world:latest --nodes local-control-plane --name local
