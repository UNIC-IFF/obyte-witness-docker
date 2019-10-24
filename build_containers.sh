#!/bin/bash

DOCKERFILES_ROOT=$(realpath ./docker)
DOCKERFILE=${DOCKERFILES_ROOT}/Dockerfile_obyte

IMAGE_NAME=obyte-witness-node

docker build -t ${IMAGE_NAME} -f ${DOCKERFILE} $DOCKERFILES_ROOT

