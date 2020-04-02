# Dockerized Order Provider (Witness) Node

To run an Obyte Order Provider (Witness) Node, one can either build the Obyte witness node OR pull the image direcly from [UNIC-IFF Dockerhub](https://hub.docker.com/orgs/uniciff/repositories). 

## Pulling the docker images from the Dockerhub
```
docker pull uniciff/obyte-witness
docker pull uniciff/tor-socks-proxy
```
The recommended way to setup the witness node is described below.

## Building Obyte docker image
To build the docker image for Obyte witness node, run the following.

```bash
chmod +x ./build_containers.sh
./build_containers.sh
```
Be patient, this process might take a while.

## Running the Obyte witness node
According to the official [Obyte witness guide](https://github.com/byteball/obyte-witness), it is highly recommended to run the witness node behind a Tor proxy.

First, we have to create a docker volume to keep data persistent.

```
docker volume create obyte-witness-config
```
Then, we launch the witness-node behind a tor-proxy. We are also providing this as a container.
* Building the image and using it
```
docker-compose -f docker-compose-build.yaml up -d
```

* Using the provided obyte-witness image from Dockerhub
```
docker-compose up -d -f docker-compose.yaml
```

and then run then node

```
docker exec -it obyte_witness sh -c "node --max-old-space-size=4096 start.js"
```
and wait for it to ask for a passphrase. 

### Using the script
Alternatively, you can make use of a simple bash script we are providing.
```
chmod +x run_obyte_witness.sh
./run_obyte_witness.sh
```

## Configuration of the witness node
The configuration file of the witness node, and the keys are stored in the docker volume. In order to pass the configuration of the node in the container, one can either edit it using nano editor in the container or copy a local file in the container.

Firstly, access the bash of the container, and then use *nano*  to edit the file.
```
docker exec -it obyte_witness /bin/bash
$> nano ~/.config/obyte-witness/conf.json
```
To copy a file, in this case *myconf.json* in the container execute the following.
```
docker cp ./myconf.json obyte_witness:/home/node/.config/obyte-witness/conf.json
```
After passing the config file in the container, we need to restart the node to make sure that it will use the new configuration. Just restart the container, that will do the trick.

```
docker-compose -f docker-compose-build.yml stop obyte-witness-node
docker-compose -f docker-compose -build.yml start obyte-witness-node
docker exec -it obyte_witness sh -c "node --max-old-space-size=4096 start.js"
```
OR restart both services

```
docker-compose -f docker-compose-build.yml down
docker-compose -f docker-compose-build.yml up -d
docker exec -it obyte_witness sh -c "node --max-old-space-size=4096 start.js"
```

## Update Obyte Witness List to the newest one
The witness list is stored in the *sqlite* database of the node. The recommended way to update the witnesses list is by executing the newest version of *replace_witnesses.js*.
We have written a small bash script that does it for us. 

```
chmod +x ./replace_witnesses.sh
./replace_witnesses.sh
```


## Usefull Links
* [Obyte witness](https://github.com/byteball/obyte-witness)

## Contributors

IFF Research Team @ UNIC

* Antonios Inglezakis ( @antIggl ) - Researcher / Senior Software Engineer and Systems Administrator, University of Nicosia - Institute For the Future (UNIC-IFF)
* Klitos Christodoulou ( @klitoschr ) - Research Manager and Faculty Member, University of Nicosia - Institute For the Future (UNIC-IFF)
* Elias Iosif ( @iosife ) - Faculty Member, University of Nicosia - Institute For the Future (UNIC-IFF)

## About IFF 

[IFF](https://www.unic.ac.cy/iff/) is an interdisciplinary research centre, aimed at advancing emerging technologies, contributing to their effective application and evaluating their impact. The general mission at IFF is to educate leaders, develop knowledge and build communities to help society prepare for a future shaped by transformative technologies. The institution has been engaged with the community since 2013 offering the World’s First Massive Open Online Course (MOOC) on blockchain and cryptocurrency for free, supporting the community and bridging the educational gap on blockchains and digital currencies.

