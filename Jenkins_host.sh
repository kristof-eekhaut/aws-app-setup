#!/bin/bash
yum update -y
amazon-linux-extras install java-openjdk11 -y
yum install git -y
yum install maven -y	
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
service jenkins start
