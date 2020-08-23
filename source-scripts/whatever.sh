#!/bin/sh

apt-get -q update && apt-get -q -y install python3-pip unzip git curl
pip3 install aws-sam-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

aws --version
sam --version

git clone https://github.com/tfutils/tfenv.git /usr/local/tfenv
ln -s /usr/local/tfenv/bin/* /usr/local/bin

git clone https://github.com/cunymatthieu/tgenv.git /usr/local/tgenv
ln -s /usr/local/tgenv/bin/* /usr/local/bin


tfenv install latest
tfenv use latest

tgenv install latest
tgenv use latest

ls -al /usr/local/bin
ls -al /usr/local/tfenv/bin/
ls -al /usr/local/tgenv/bin/

terraform version
tgenv list
