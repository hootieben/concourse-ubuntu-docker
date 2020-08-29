FROM ubuntu:focal AS base
RUN apt-get -q update\
  && apt-get -q -y install \
  unzip \
  git \
  curl \
  python3-pip \
  jq\
  && apt clean\
  && rm -rf /var/lib/apt/lists/*

FROM base AS aws
RUN pip3 install --user aws-sam-cli\
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"\
    && unzip awscliv2.zip\
    && ./aws/install -i ~/.local/aws-cli -b ~/.local/bin

FROM base AS tfenv
COPY tfenv-release /root/.tfenv
ENV PATH=/root/.tfenv/bin:/root/.tgenv/bin:root/.local/bin:$PATH
RUN /root/.tfenv/bin/tfenv install latest && /root/.tfenv/bin/tfenv use latest

FROM base AS tgenv
COPY tgenv-release /root/.tgenv
ENV PATH=/root/.tfenv/bin:/root/.tgenv/bin:root/.local/bin:$PATH
RUN /root/.tgenv/bin/tgenv install latest

FROM base
ENV PATH=/root/.tgenv/bin:/root/tgenv/bin:root/.local/bin:$PATH
COPY --from=aws /root/.local /root/.local
COPY --from=tfenv /root/.tfenv /root/.tfenv
COPY --from=tgenv /root/.tgenv /root/.tgenv

ENV PATH=/root/.tfenv/bin:/root/.tgenv/bin:root/.local/bin:$PATH
CMD ["/bin/bash"]
