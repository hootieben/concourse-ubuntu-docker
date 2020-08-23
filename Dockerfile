FROM ubuntu:focal
ARG tfenv

RUN set -xe \
  \
  && apt-get -q update \
  && apt-get -q -y install unzip git curl \
  && git clone --depth 1 --branch $tfenv https://github.com/tfutils/tfenv.git

CMD ["/bin/bash"]
