.. highlight:: rest

IPOP Roll 
================
.. contents::  

Introduction
----------------

This roll provides 

* Erland XMPP server 

* IPOP (IP-over-P2P), an open-source software allowing
  end users to define 
  and create their own virtual private networks (VPNs) and provides some 
  convenience scripts for setting up a new IPOP VPN.


Installed components
---------------------

* ejabberd (frontend only)
  
* ipop

* Includes ipv6 kernel modification

* Includes initd scripts

* Includes default IPOP configuration files

* Include two convenience scripts for setting up a new IPOP VPN   

  #. create-ipop-vpn <password> (to be run on frontend of virtual cluster) 

     + will create a new VPN network (use IP space based on existing private network IP)
     + set the password
     + return an authentication token
     + provide a simple service to authenticate token from clients and provide them with password and unique IP address (maybe as a PHP script?)

  #. join-ipop-vpn <public ip of virtual cluster frontend> <token> (to be run on each virtual cluster compute)

     + contact frontend and get an assigned IP address
     + write json file and startup IPOP daemons

