#!/usr/bin/env bash

find "config_scripts" -name '*.sh' -type f -exec realpath {} \; |
while read script
do
  echo "Executing: $script"
  pushd ~ > /dev/null
  bash "$script"
  popd > /dev/null
done
