#!/usr/bin/env bash

ENDPOINT="http://0.0.0.0:8080"

REQ=$(curl -sL "$ENDPOINT/")

[[ "$(echo $REQ | jq -j .name)" == "Iko" ]]   || exit 1
[[ "$(echo $REQ | jq -j .id)" == "ABC1234" ]] || exit 1
[[ "$(echo $REQ | jq -j .age)" == 20 ]]       || exit 1
