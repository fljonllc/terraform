#!/bin/bash

# update yum packages
sudo yum update -y

# install Docker using yum
sudo yum install -y docker

# start the Docker service
sudo service docker start

# enable Docker to start on boot
sudo systemctl enable docker

# verify Docker is installed and running
sudo docker info
