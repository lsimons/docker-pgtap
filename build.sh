#!/usr/bin/env bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"

     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     cd -P "$( dirname "$SOURCE" )"
     pwd
}

cd "$(get_script_dir)"

DOCKER="docker"

source ./.dockerimage
VCS_REF=$(git describe --tags --dirty)
VERSION=$(git describe --tags --dirty)

$DOCKER build --build-arg BUILD_DATE=$(date -Iseconds) \
    --build-arg VCS_REF=$VCS_REF \
    --build-arg VERSION=$VERSION \
    --tag "$IMAGE:latest" \
    --tag "$IMAGE:$VERSION" \
    .
