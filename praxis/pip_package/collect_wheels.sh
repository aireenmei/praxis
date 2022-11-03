#!/bin/bash

function collect_wheels() {
  release_version=$1
  wheel_version="${release_version}"
  if [ "${release_version}" != "nightly" ]; then
    wheel_version=$( echo "${release_version}" | grep -oP '\d+.\d+(.\d+)?' )
  fi

  mkdir /tmp/staging-wheels
  pushd /tmp/staging-wheels
  cp /tmp/paxml_pip_package_build/praxis-*.whl .
  rename -v "s/^praxis-(.*?)-py3/praxis-${wheel_version}+$(date -u +%Y%m%d)-py3/" *.whl
  popd
  mv /tmp/staging-wheels/* .
}

