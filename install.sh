#!/bin/bash

# this script is only tested on ubuntu xenial

# install docker
apt-get remove docker docker-engine docker.io
apt-get update
apt-get install  apt-transport-https  ca-certificates  curl  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository   "deb [arch=amd64] https://download.docker.com/linux/ubuntu   $(lsb_release -cs)  stable"
apt-get update
apt-get install docker-ce

# run jenkins
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home  -v /var/run/docker.soсk:/var/run/docker.sock -d --name jenkins olexiy/jenkins-with-docker

# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'
