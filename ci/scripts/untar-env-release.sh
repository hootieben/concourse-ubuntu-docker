#!/usr/bin/env bash

for i in tfenv-release tgenv-release
do 
  tar xvzf $i/source.tar.gz -C ubuntu-docker-git/$i
done
