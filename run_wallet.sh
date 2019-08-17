#!/bin/bash
env

monero-wallet-cli \
--wallet-file /root/wallet/$WALLETFILE \
--password-file /root/wallet/$WALLETPASSWORDFILE \
--trusted-daemon \
--daemon-address $RPCHOST:$RPCPORT \
--daemon-login $RPCUSER:$RPCPASS \