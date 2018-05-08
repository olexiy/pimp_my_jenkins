FROM jenkins/jenkins:lts

#Install a set of default plugins into the Jenkins container
USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#Configure Jenkins with the script
#TOOD: add all tools and additional config  for the java/spring development into the script
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install docker and configure access rights to access the host system docker ower the socket
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -a -G docker jenkins

#Fallback to Jenkins user
USER jenkins
