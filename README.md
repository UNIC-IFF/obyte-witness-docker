# Dockerized Obyte Witness Node

To run a Obyte witness node, one can either build the Obyte witness node OR pull the image straight from the DockerHub.
## Pulling the docker image from the Docker Hub
```
docker pull antiggl/obyte-witness
```
The recommended way to setup the witness node is described below.

## Building Obyte docker image
To build the docker image for Obyte witness node, run the following.

```bash
chmod +x ./build_containers.sh
./build_containers.sh
```
That will take a while.

## Running the Obyte witness node
According to the official [Obyte witness guide](https://github.com/byteball/obyte-witness), it is highly recommended to run the witness node behind a Tor proxy.

First, we have to create a docker volume to keep data persistent.

```
docker volume create obyte-witness-config
```
Then, we launch the witness-node behind a tor-proxy.
* Building the image and using it
```
docker-compose up -d -f docker-compose-build.yaml
```

* Using the provided obyte-witness image from Dockerhub
```
docker-compose up -d -f docker-compose.yaml
```


## Usefull Links
* [Obyte witness](https://github.com/byteball/obyte-witness)

## Contributors
* Antonios Inglezakis ( @antIggl )

