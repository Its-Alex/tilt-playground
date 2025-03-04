#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

ctlptl delete cluster --cascade "true" kind-local
