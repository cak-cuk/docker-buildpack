# base image
FROM udienz/buildpack:centos8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://archive.kernel.org\/centos-vault|g' /etc/yum.repos.d/CentOS-Linux-* \
 && yum update -y \
 && yum install -y --nogpg epel-release \
 && yum install -y --nogpg wget subversion mercurial cvs \
 && yum groupinstall -y "Development Tools" \
 && yum update -y \
 && yum clean all
