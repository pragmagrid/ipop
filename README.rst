.. highlight:: rest

IPOP Roll
==============
.. contents::  

Introduction
----------------

This roll installs IPOP (IP-over-P2P), an open-source software allowing end users to define 
and create their own virtual private networks (VPNs).

See IPOP project `home page  <http://ipop-project.org>`_  and 
`github <https://github.com/ipop-project>`_ for more info

Prerequisites
~~~~~~~~~~~~~

This section lists all the prerequisites for ipop code dependencies.
The dependencies are either build from source or installed from RPMs 
during the roll build.

#. RPMs from standard yum repos:  

   :epel:     libyaml, libyaml-devel

#. Source distribitions: 

   :ejabberd: to run XMPP server 
   :erlang: prerequisite for ejabberd
   :ipop: tincan binary and python code 
   :turn: turnserver binary 

#.  for java-1.8.0-openjdk-1.8.0-devel yum installs :
   
    java-1.8.0-openjdk-1.8.0
    java-1.8.0-openjdk-headless-1.8.0
    tzdata-java-2016c-1

#. for nss-devel yum installs dependencies :
        nspr-4.11.0-0.1
        nspr-devel-4.11.0-0.1
        nss-3.21.0-0.3
        nss-devel-3.21.0-0.3
        nss-softokn-3.14.3-23
        nss-softokn-devel-3.14.3-23
        nss-softokn-freebl-3.14.3-23
        nss-softokn-freebl-3.14.3-23
        nss-softokn-freebl-devel-3.14.3-23
        nss-sysinit-3.21.0-0.3
        nss-tools-3.21.0-0.3
        nss-util-3.21.0-0.3
        nss-util-devel-3.21.0-0.3

#. Installed:
   /etc/yum.repos.d/devtools-1.1.repo

   yum install devtoolset-1.1
     Dependency Installed:
       devtoolset-1.1-binutils.x86_64
       devtoolset-1.1-dwz.x86_64 
       devtoolset-1.1-elfutils.x86_64
       devtoolset-1.1-elfutils-libelf.x86_64
       devtoolset-1.1-elfutils-libs.x86_64 
       devtoolset-1.1-gcc.x86_64 
       devtoolset-1.1-gcc-c++.x86_64
       devtoolset-1.1-gcc-gfortran.x86_64 
       devtoolset-1.1-gdb.x86_64 
       devtoolset-1.1-libquadmath-devel.x86_64 
       devtoolset-1.1-libstdc++-devel.x86_64
       devtoolset-1.1-oprofile.x86_64
       devtoolset-1.1-runtime.noarch
       devtoolset-1.1-systemtap.x86_64 
       devtoolset-1.1-systemtap-client.x86_64 
       devtoolset-1.1-systemtap-devel.x86_64
       devtoolset-1.1-systemtap-runtime.x86_64
       devtoolset-1.1-valgrind.x86_64 
       scl-utils.x86_64

Downloads 
~~~~~~~~~~~~ 
::  

    wget http://www.erlang.org/download/otp_src_17.0.tar.gz
    wget http://www.process-one.net/downloads/downloads-action.php?file=/ejabberd/14.07/ejabberd-14.07.tgz
    wget -O ipop-14.07.0-x86_64_CentOS6.tar.gz http://goo.gl/3nHK7Z

    wget http://erlang.org/download/otp_src_18.0.tar.gz

    wget https://github.com/ipop-project/Downloads/releases/download/v16.08.0/ipop-v16.08.0_ubuntu.tar.gz  
    wget https://github.com/ipop-project/Downloads/releases/download/v16.01.1/ipop-v16.01.1_centos7.tar.gz


Building a roll 
------------------

Checkout roll distribution from git repo :: 

   # git clone https://github.com/pragmagrid/ipop.git 
   # cd ipop/

To build a roll, first execute a script that downloads and installs some packages 
and RPMS that are prerequisites for other packages during the roll build stage: ::

   # bash ./bootstrap.sh  

To build a roll ::  

   # make roll

The resulting ISO file ipop-*.iso is the roll that can be added to the frontend.


Adding a roll 
--------------
The roll (ISO file) can be added (1) during the initial installation of the cluster (frontend)
or (2) to the existing frontend.


Adding a roll to a new server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Add roll ISO to your existing frontend that is configured to be 
   a central server. This procesdure is documented in the section ``Frontend 
   Central Server`` of `Rocks Users Guide <http://central6.rocksclusters.org/roll-documentation/base/6.1.1/>`_.

#. During the frontend install choose the ipop roll from the list of available rolls
   when you see ``Select Your Rolls`` screen. 


Adding a roll to a live frontend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A roll can be added to the existing frontend. 
Make sure that the python roll is installed (can be downloaded from
`Rocks Downloads <http://www.rocksclusters.org/wordpress/?page_id=80>`_ )

Execute all commands from top level ipop/ ::

   # rocks add roll ipop-6.1-0.x86_64.disk1.iso   
   # rocks enable roll ipop
   # (cd /export/rocks/install; rocks create distro)  
   # yum clean all
   # rocks run roll ipop > add-roll.sh  
   # bash add-roll.sh  > add-roll.out 2>&1

Where installed roll components are
------------------------------------

#. **/opt/ipop**  - ipop  distribution

   * **/opt/ipop/bin/**  

     + start-gvpn  -  ipop start up script 
     + stop-gvpn   - ipop shutdown script 
     + updateConfJson - script to create config json file

   * **/opt/ipop/etc/**

     + config.json.template - template for json file
     + ipopserver.info - ipop info, used for creating json config file

   * **/etc/rc.d/init.d/ipop/** - init script  to start ipop

#. **/opt/ipop/erlang/** - prerequisite fro xmpp ejabberd server

#. XMPP Ejabberd server

   + Created user ``ejabberd``
   + **/opt/ipop/ejabberd/** - xmpp ejabberd server
   + **/var/lib/ejabberd/** - database 
   + **/var/log/ejabberd/** - log files
   + **/etc/rc.d/init.d/ejabberd/** - init script to start XMPP server

TODO
---------

#. deal with grub.conf and grub-orig.conf: when to automate and how

#. deal with  making ipop interface and changing MAC 
