# base image
FROM udienz/buildpack:centos6

# Fix EOL Mirror issue
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://archive.kernel.org\/centos-vault|g' /etc/yum.repos.d/CentOS-* \
 && yum update -y \
 && yum install -y --nogpg epel-release \
 && yum install -y --nogpg wget subversion bzrtools mercurial cvs \
 && yum update -y \
 && yum groupinstall -y "Development Tools" \
 && yum clean all
