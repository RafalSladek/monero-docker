#!/bin/bash
env

monerod \
--config-file=/root/.bitmonero/bitmonero.conf \
--detach \
--rpc-login $RPCUSER:$RPCPASS \
--confirm-external-bind