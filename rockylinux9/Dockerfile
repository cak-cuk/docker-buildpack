FROM rockylinux/rockylinux:9

RUN dnf install -y epel-release \
    && dnf install -y --setopt=install_weak_deps=False git subversion mercurial cvs sudo wget ca-certificates \
    && dnf group install -y "Development Tools" \
    && dnf clean all \
    && rm -rf /var/cache/dnf
