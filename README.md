# monero-docker

This image use ubuntu 16.04 to run monero daemon and monero wallet
It creates by default a wallet and stores password in a file

### How to install this image
```
docker pull rafalsladek/monero-docker
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
docker run -it -v ~/.bitmonero:/root/.bitmonero rafalsladek/monero-docker:latest /bin/bash
```

### How to import blockchain.raw (inside docker conatiner)
```
monero-blockchain-import --input-file /root/.bitmonero/blockchain.raw --batch-size 50000 --verify 0 --batch 1
```

### How to start monero daemon
```
screen -dmS monerodaemon monerod --fast-block-sync 1
```

### How to attache to screen session with monerodaemon (detach is ctrl+a ctrl+d)
```
screen -x monerodaemon
```

### How to start wallet
```
monero-wallet-cli --password-file ~/private.wallet.password --wallet-file ~/private.wallet
```

enjoy
