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


Downloads 
~~~~~~~~~~~~ 
::  

    wget http://www.erlang.org/download/otp_src_17.0.tar.gz
    wget http://www.process-one.net/downloads/downloads-action.php?file=/ejabberd/14.07/ejabberd-14.07.tgz
    wget -O ipop-14.07.0-x86_64_CentOS6.tar.gz http://goo.gl/3nHK7Z


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
