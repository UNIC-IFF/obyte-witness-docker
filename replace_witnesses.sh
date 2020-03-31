#!/bin/bash

# Downloads the replace-witness script from the github repository.
docker exec -it obyte-witness-node sh -c "wget -O replace-witnesses.js https://github.com/byteball/headless-obyte/raw/master/tools/replace-witnesses.js"

# Runs the script in the working directory. 
# Note: It remains active once it is finished. User should terminate the script when it stops printing messages.
docker exec -it obyte-witness-node sh -c "node replace-witnesses.js"


