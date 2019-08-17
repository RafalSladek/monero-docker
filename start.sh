#!/bin/bash
env

monerod \
--config-file=/root/.bitmonero/bitmonero.conf \
--detach \
--rpc-login $RPCUSER:$RPCPASS \
--confirm-external-bind


sleep 180

monero-wallet-cli \
--wallet-file /root/wallet/$WALLETFILE \
--password-file /root/wallet/$WALLETPASSWORDFILE \
--trusted-daemon \
--daemon-address $RPCHOST:$RPCPORT \
--daemon-login $RPCUSER:$RPCPASS \