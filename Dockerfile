FROM nvidia/cuda:11.3.1-cudnn8-devel-centos7

MAINTAINER Matthias J. Schnepf  <matthias.jochen.schnepf@cern.ch>

RUN update-ca-trust
ADD repos/UMD-4-updates.repo /etc/yum.repos.d/
ADD repos/egi-trustanchors.repo /etc/yum.repos.d/
RUN yum -y install epel-release

ADD http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3 /etc/pki/rpm-gpg/

RUN yum -y update && yum clean all
RUN yum -y install \
ca-policy-egi-core authconfig boost-devel glibc-headers globus-proxy-utils \
globus-gass-copy-progs which \
attr cyrus-sasl-devel e2fsprogs-devel expat-devel \
file-devel giflib-devel gmp-devel gpm-devel kernel-devel libacl-devel \
libattr-devel libcap-devel libcom_err-devel libcurl-devel libdrm-devel \
libdrm-devel libstdc++-devel libuuid-devel libxml2-devel lockdev-devel \
libjpeg-turbo-devel netpbm-devel popt-devel python-devel \
rpm-devel tcl-devel tk-devel openssh-clients PyXML \ 
voms-clients3 wlcg-voms-cms emi-wn \
HEP_OSlibs time tar perl bzip2 gcc freetype glibc-headers glibc-devel \
subversion make gcc gcc-c++ binutils patch wget python python3 libxml2-devel \
libX11-devel libXpm-devel libXft-devel libXext-devel bzip2-devel openssl-devel \
ncurses-devel readline-devel mesa-libGL-devel libgfortran.x86_64 glew-devel \
git krb5-workstation libtool-ltdl lcg-util.x86_64 bc tcsh atlas \
gsl gsl-devel xrootd-client sssd dcap-tunnel-gsi \
libpng-devel python3-devel python3-pip strace\
&& yum clean all

WORKDIR /workspace
RUN chmod -R a+w .
