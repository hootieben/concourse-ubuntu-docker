#!/usr/bin/bash

jq -n --arg tfver `cat tfenv-release/tag` '{tfver: $tfver}'
