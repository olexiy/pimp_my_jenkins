# pimp_my_jenkins
My own Docker compose and Docker file collection for the quick deployment of the CI/CD Server with Jenkins, Docker and SonarQube
in the current version and with the Plugins and configurations I need. This build of the Jenkins CI/CD is made to support Java/Spring-Boot/Maven/Docker tolls set. 

Basis for this build is a [Latest version of the Jenkins Docker container](https://hub.docker.com/r/jenkins/jenkins/)



Jenkins Plugin Export :
JENKINS_HOST=username:password@myhost.com:port
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>+/\1 \2\n/g'


Build pymp-my-jenkins image:
cd Jenkins 
docker build -t pimp-my-jenkins .

Following Plugins are installed additionally: 
+ docker-build-publish
+ pipeline-maven

+ email-ext
+ artifactory
+ slack
+ sonar
+ blueocean

Testing Docker availability from the Jenkins:
> docker exec -it jenkins bush
> docker ps -a

Your docker image must be visible in the container list.

[Job DSL API Dokumentation](https://jenkinsci.github.io/job-dsl-plugin/)

[Pipeline Maven Plugin](https://wiki.jenkins.io/display/JENKINS/Pipeline+Maven+Plugin)

TODO: extend groovy script to add tools installation for maven and jdk - [help](https://wiki.jenkins.io/display/JENKINS/Jenkins+Script+Console)