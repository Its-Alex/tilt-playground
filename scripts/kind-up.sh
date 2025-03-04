#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

LOCAL_REGISTRY=0

VALID_ARGS=$(getopt -o "" --long "local-registry" -- "$@")
# shellcheck disable=SC2181 # irrelevant because we use command more than one time
if [[ $? -ne 0 ]]; then
    exit 1
fi

eval set -- "$VALID_ARGS"
while [ "$1" != "--" ]; do
    case "$1" in
    --local-registry)
        LOCAL_REGISTRY=1
        shift
        ;;
    --)
        shift
        break
        ;;
    esac
done



cat <<EOF | ctlptl apply -f -
apiVersion: ctlptl.dev/v1alpha1
kind: Cluster
product: kind
registry: $( [ "$LOCAL_REGISTRY" -eq 0 ] || [ "$LOCAL_REGISTRY" = false ] && echo "" || echo "ctlptl-registry" )
kindV1Alpha4Cluster:
  name: local
  nodes:
  - role: control-plane
    image: kindest/node:v1.32.1
    extraPortMappings:
    - containerPort: 30001
      hostPort: 30001
      protocol: TCP
  networking:
    apiServerPort: 6443
EOF
