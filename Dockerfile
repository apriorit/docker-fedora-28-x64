# start from base fedora
FROM fedora:28
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

# REQUIREMENTS
RUN dnf -yqq update && dnf -yqq upgrade \
    && dnf -yqq install 'dnf-command(builddep)' libtool m4 automake \
    && dnf -yqq builddep libguestfs libldm libcap libvirt libselinux fuse gdisk acl \
    && dnf -yqq install make texinfo autoconf automake bc gettext \
       git gperf gzip perl rsync tar jansson-devel

# Fix problem with get info for some binary files
RUN dnf -yqq install file-5.32-3.fc28 && dnf clean all
