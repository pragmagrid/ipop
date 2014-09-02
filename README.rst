.. highlight:: rest

IPOP Roll
==============
..contents::  

Introduction
----------------

This roll installs IPOP (IP-over-P2P), an open-source software allowing end users to define 
and create their own virtual private networks (VPNs).


Download ipop src 
--------------------

   wget -O ipop-14.07.0-x86_64_CentOS6.tar.gz http://goo.gl/3nHK7Z

+ tar.gz contains python files and  a precompiled binary ``ipop-tincan``
+ there is a prebuild i686 rpm requires the following: expat-2.0.1 libstdc++-4.4.6
  libX11-1.3 libXau-1.0.5 libxcb-1.5. Assume  similar dependency for tar.gz