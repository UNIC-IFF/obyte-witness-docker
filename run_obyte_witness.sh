#!/bin/bash

# create docker volume ( only when we run docker with volume)
docker volume create obyte-witness-config

docker-compose -f docker-compose.yaml up -d

# wait till done

docker exec -it obyte_witness sh -c "node --max-old-space-size=4096 start.js"

# the  start.js script asks for the passphrase, so the user should input the passphrase 
# and let the script running in the background. (hit Ctrl+P+Q )


