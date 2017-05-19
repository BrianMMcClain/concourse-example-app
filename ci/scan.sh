#!/bin/bash

set -e -x

pushd concourse-example-app
  curl -sSL  https://download.sourceclear.com/ci.sh | bash -s -- scan . --allow-dirty --json > scan.json
  ruby ci/parse_srcclr_scan.rb
popd
