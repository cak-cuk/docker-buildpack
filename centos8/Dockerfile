# base image
FROM centos:8

# Install Packages
RUN yum update -y \
    && yum install -y --nogpg epel-release \
    && yum install -y --nogpg wget subversion mercurial cvs \
    && yum groupinstall -y "Development Tools" \
    && yum update -y \
    && yum clean all
