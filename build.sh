#!/bin/bash -e

DIRNAME=$(dirname "$0")
DOCKER_REPOSITORY=${DOCKER_REPOSITORY-"magnetikonline/acestream-server"}

docker build --no-cache "$DIRNAME"/acestream
