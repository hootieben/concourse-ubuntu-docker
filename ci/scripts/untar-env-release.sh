#!/usr/bin/env bash

for i in tfenv-release tgenv-release
do 
  mkdir ubuntu-docker-git/$i
  tar xvzf $i/source.tar.gz --strip-components=1 -C ubuntu-docker-git/$i
done
