#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

kind create cluster --config=config/kind-cluster-config.yaml
