FROM ubuntu:focal
ARG tfenv
ARG tgenv

RUN set -xe \
  \
  && apt-get -q update \
  && apt-get -q -y install unzip git curl \
  && git clone --depth 1 --branch $tfenv https://github.com/tfutils/tfenv.git /usr/local/tfenv \
  && git clone --depth 1 --branch $tgenv https://github.com/cunymatthieu/tgenv.git /usr/local/tgenv 

RUN set -xe \
  \
  && pip3 install aws-sam-cli

RUN set -xe \
  \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install

RUN set -xe \
  \
  && ln -s /usr/local/tfenv/bin/* /usr/local/bin \
  && ln -s /usr/local/tgenv/bin/* /usr/local/bin \
  && tgenv install latest \
  && tgenv use latest \
  && tfenv install latest \
  && tfenv use latest


CMD ["/bin/bash"]
