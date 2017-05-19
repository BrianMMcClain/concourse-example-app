#!/bin/bash

set -e -x

pushd concourse-example-app
  echo $SRCCLR_API_TOKEN
  curl -sSL  https://download.sourceclear.com/ci.sh | bash -s -- scan . --allow-dirty --json
  ruby -v
popd
