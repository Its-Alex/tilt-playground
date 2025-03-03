#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker build -t flask-hello-world .
