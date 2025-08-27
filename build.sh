#!/bin/bash -e

DOCKER_REPOSITORY=${DOCKER_REPOSITORY-"magnetikonline/acestream-server"}

cd acestream

docker build --no-cache .
