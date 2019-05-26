# monero-docker

This image use ubuntu 16.04 to run monero daemon

### How to install this image
```
docker pull rafalsladek/monero-docker
```

### How to download monero blockchain.
You need to download to your machine blockchain file from getmonero.com
```
cd && mkdir .bitmonero && cd .bitmonero
wget https://downloads.getmonero.org/blockchain.raw
```

### How to import blockchain.raw - one time action
```
docker run -it --rm -v ~/.bitmonero:/root/.bitmonero 
rafalsladek/monero-docker:latest 
monero-blockchain-import 
--show-time-stats=1 
--resume=1 
--batch=1 
--batch-size=10000 
--input-file=/root/.bitmonero/blockchain.raw 
```

### How to use this image for full node
```
docker run -d \
    -e TZ=Europe/Berlin \
    -v ~/.bitmonero:/root/.bitmonero \
    -p 18080:18080 \
    -p 18081:18081 \
    --name monero-fullnode \
    --restart unless-stopped \
      rafalsladek/monero-docker:latest
```

```
docker run -d \
    -e TZ=Europe/Berlin \
    -v ~/.bitmonero:/root/.bitmonero \
    -p 18080:18080 \
    -p 18081:18081 \
    --name monero-fullnode \
    --restart unless-stopped \
      rafalsladek/monero-docker:latest
```

### How to see logs of running the container
```
docker logs monero-fullnode --follow
```

### How to attach to running the container
```
docker attach monero-fullnode
```
