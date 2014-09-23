#!/bin/bash

. /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh

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
