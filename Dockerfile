FROM ubuntu:latest
LABEL Author="Rafal Sladek rafal.sladek@gmail.com"

ENV TZ=Europe/Berlin
ENV RPCUSER=PleaseChangeMe
ENV RPCPASS=PleaseChangeMe
ENV DAEMON_VERSION=0.14.1.2
ENV DAEMON_ZIP=monero-linux-x64-v${DAEMON_VERSION}.tar.bz2
ENV DAEMON_SRC=https://dlsrc.getmonero.org/cli/${DAEMON_ZIP}
ENV DAEMON_FILE_SHA265=a4d1ddb9a6f36fcb985a3c07101756f544a5c9f797edd0885dab4a9de27a6228

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -yq update && \
    apt-get -y upgrade && \
    apt-get -y install tree wget bzip2 tzdata gzip curl && \
    apt-get autoclean autoremove -yq && \
    apt-get clean -yq

RUN dpkg-reconfigure -f noninteractive tzdata

RUN cd /tmp && \
    echo "About to download $DAEMON_SRC" && \
    wget -q --show-progress $DAEMON_SRC

RUN openssl dgst -sha256 /tmp/${DAEMON_ZIP} && \
    echo "SHA265 should be equal to: $DAEMON_FILE_SHA265"

RUN cd /usr/local/bin && \
    ls -al /tmp/${DAEMON_ZIP} && \
    tar -xvf /tmp/${DAEMON_ZIP} && \
    mv monero-x86_64-linux-gnu/* .

RUN rm -f /tmp/${DAEMON_ZIP} && \
    rm -rf monero-x86_64-linux-gnu

WORKDIR /root/

VOLUME [ "/root/.bitmonero", "/root/wallet" ]

EXPOSE  18080 18081

CMD [ "monerod" , "--rpc-login=${RPCUSER}:${RPCPASS}", "--restricted-rpc", "--rpc-bind-ip=0.0.0.0", "--check-updates=update", "--confirm-external-bind" ]
