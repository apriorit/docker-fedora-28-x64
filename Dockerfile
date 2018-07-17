# start from base fedora
FROM fedora:28
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

# REQUIREMENTS
RUN dnf -yqq update
RUN dnf -yqq install 'dnf-command(builddep)'
RUN dnf -y install libtool 
RUN dnf -y install m4
RUN dnf -y install automake
RUN dnf -yqq builddep libguestfs 
RUN dnf -yqq builddep libldm libcap libvirt libselinux fuse gdisk acl
RUN dnf -yqq install make
RUN dnf -yqq install texinfo
RUN dnf -yqq install autoconf automake bc gettext git gperf gzip perl rsync tar  

# Fix problem with get info for some binary files
RUN dnf -yqq install file-5.32-3.fc28

#BUILDING FROM GIT
#COPY ./install_libquestfs_fedora.sh /app/install_libquestfs_fedora.sh
#RUN chmod +x /app/install_libquestfs_fedora.sh 
#CMD /app/install_libquestfs_fedora.sh
