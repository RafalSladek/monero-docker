FROM ubuntu:latest
WORKDIR /usr/local/bin
RUN apt-get update -y -qq && apt upgrade -y -qq
RUN apt-get install -y -qq sudo curl git vim htop wget bzip2 screen

ENV walletPass=MyPriv4teP4sworD!
RUN echo $walletPass > ~/private.wallet.password

ENV moneroVersion=v0.11.1.0
ENV user=monerodaemon

RUN wget https://downloads.getmonero.org/cli/monero-linux-x64-${moneroVersion}.tar.bz2
RUN tar -xvjf monero-linux-x64-${moneroVersion}.tar.bz2 && rm -f monero-linux-x64-${moneroVersion}.tar.bz2
RUN cd monero-${moneroVersion} && ./monero-wallet-cli --generate-new-wallet ~/private.wallet --mnemonic-language English --password-file ~/private.wallet.password --log-file /var/log/monero-wallet-cli.log
RUN cd monero-${moneroVersion} && mv * .. && cd .. && rm -rf monero-${moneroVersion}
RUN chmod 400 ~/private.wallet.* 
RUN echo "alias wallet='/usr/local/bin/monero-wallet-cli --wallet-file ~/private.wallet --password-file ~/private.wallet.password --log-file /var/log/monero-wallet-cli.log'" >> ~/.bash_aliases

ADD monerod.service monerod.service
VOLUME [ "/root/.bitmonero" ]
EXPOSE  18081

#RUN mv monerod.service /etc/systemd/system/monerod.service
#RUN /bin/systemctl enable monerod.service
#RUN /bin/systemctl status monerod
