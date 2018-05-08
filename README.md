# monero-fullnode

This image use ubuntu 16.04 to run monero daemon and monero wallet
It creates by default a wallet and stores password in a file

### How to install this image
```
docker pull rafalsladek/monero-fullnode
```

### How to download monero blockchain.

You need to download to your machine blockchain file from getmonero.com
```
cd 
mkdir .bitmonero && cd .bitmonero
wget https://downloads.getmonero.org/blockchain.raw
```


### How to use this image
```
docker run -it -v ~/.bitmonero:/root/.bitmonero rafalsladek/monero-fullnode:latest /bin/bash
```

### How to import blockchain.raw (inside docker conatiner)
```
monero-blockchain-import --input-file /root/.bitmonero/blockchain.raw --batch-size 50000 --verify 0 --batch 1
```