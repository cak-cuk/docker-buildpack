# base image
FROM udienz/buildpack:centos8

# Fix EOL Mirror issue
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

# Install Packages
RUN yum update -y \
    && yum install -y --nogpg epel-release \
    && yum install -y --nogpg wget subversion mercurial cvs \
    && yum groupinstall -y "Development Tools" \
    && yum update -y \
    && yum clean all
