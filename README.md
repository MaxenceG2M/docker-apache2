# Docker image for a light apache2

A docker container with an apache2 allow a (really) simple SSH connection (via password).
Based on the excellent [baseimage-docker](https://github.com/phusion/baseimage-docker) from [phusion](https://github.com/phusion)

## Quick start

Build the container :
```sh
docker build -t maxenceg2m/apache2 .
```

Run the container :
```sh
sudo docker run -d \
  --name="apache2" \
  -p 80:80 \
  -p 443:443 \
  maxenceg2m/apache2
```

To connect via ssh, first get the IP of the container and just do an SSH connection.
```sh
sudo docker inspect apache2 | grep IPAddress
ssh root@<IPAddress> # Password is 'root'
``` 
Change the root password or disable it in the Dockerfile.

