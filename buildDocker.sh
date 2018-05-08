#!/bin/bash
tag=latest
imageName=monero-fullnode
docker build -f Dockerfile -t rafalsladek/$imageName:$tag .
#docker push rafalsladek/$imageName:$tag
docker run -it --rm  -v $(PWD)/.bitmonero:/root/.bitmonero -p 18080:18080 -p 18081:18081 rafalsladek/$imageName /bin/bash