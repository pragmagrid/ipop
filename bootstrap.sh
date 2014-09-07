#!/bin/bash

yumdownloader --enablerepo=epel --resolve ejabberd
yumdownloader --enablerepo=epel --resolve libgsasl
yumdownloader --enablerepo=base --resolve libntlm
yumdownloader --enablerepo=base --resolve zlib
yumdownloader --enablerepo=base --resolve zlib-devel
yumdownloader --enablerepo=epel --resolve erlang-sasl

