# pimp_my_jenkins
My own Docker compose and Docker file collection for the quick deployment of the CI/CD Server with Jenkins, Docker and SonarQube
in the current version and with the Plugins and configurations I need. 

Basis for this build is a [Blue Ocean version of the Jenkins Docker container](https://hub.docker.com/r/jenkinsci/blueocean/)
This image has a tag for every release of blue ocean, to run the latest, ensure you run docker pull jenkinsci/blueocean from time to time. 
And then my docker container.


Jenkins Plugin Export :
JENKINS_HOST=username:password@myhost.com:port
curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe +).*?<version>+/\1 \2\n/g'
