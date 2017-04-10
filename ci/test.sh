#!/bin/bash

set -e -x

pushd concourse-example-app
  bundle install
  bundle exec bin/rails test
popd
