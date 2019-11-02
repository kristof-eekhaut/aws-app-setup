#!/bin/bash
yum update -y
yum install git -y
amazon-linux-extras install java-openjdk11 -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
aws s3 sync --delete s3://kristof-eekhaut-jenkins-config /var/lib/jenkins 
chown -R jenkins:jenkins /var/lib/jenkins
service jenkins start

echo ' */1 *  *  *  * root       aws s3 sync --delete /var/lib/jenkins s3://kristof-eekhaut-jenkins-config' >> /etc/crontab
