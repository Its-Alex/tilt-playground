#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

kind delete cluster -n local
