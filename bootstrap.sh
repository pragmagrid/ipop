#!/bin/bash

#. /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh

prereq () {
   wget http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo 
   cp devtools-1.1.repo /etc/yum.repos.d/devtools-1.1.repo
   #yum --enablerepo=base,updates install java-1.8.0-openjdk.x86_64 
   #yum --enablerepo=base,updates install java-1.8.0-openjdk-devel.x86_64 
   #yum --enablerepo=base,updates install nss-devel.x86_64 
}

#prereq

# get libyaml and libyml-devel
(cd src/RPMS;
yumdownloader --enablerepo=epel --resolve libyaml.x86_64; \
yumdownloader --enablerepo=epel --resolve libyaml-devel.x86_64; \
)
yum --enablerepo=epel install libyaml.x86_64
yum --enablerepo=epel install libyaml-devel.x86_64

# install erlang 
compile erlang
install ipop-erlang
