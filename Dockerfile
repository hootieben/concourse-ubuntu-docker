FROM ubuntu:focal AS base
RUN apt-get -q update\
  && apt-get -q -y install unzip git curl python3-pip jq\
  && apt clean

FROM base AS aws
RUN pip3 install aws-sam-cli\
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"\
    && unzip awscliv2.zip\
    && ./aws/install

CMD ["/bin/bash"]
