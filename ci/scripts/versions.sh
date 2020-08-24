#!/usr/bin/bash

jq -n --arg tfver `cat tfenv-release/tag` --arg tgver `cat tgenv-release/tag` '{tfver: $tfver}' '{tgver: $tgver}' > relvers/build.json
