#!/bin/bash
monerod \
    --show-time-stats=1 \
    --block-sync-size=10 \
    --db-sync-mode=safe:async:1000 \
    --confirm-external-bind \
    --restricted-rpc \
    --rpc-bind-ip=0.0.0.0 \
    --bootstrap-daemon-address node.moneroworld.com:18089