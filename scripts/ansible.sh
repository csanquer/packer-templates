#!/bin/bash -eux

if [ ! -x "$(command -v lsb_release)" ]; then
    echo 'please install lsb release package'
    if [ -x "$(command -v apt-get)" ]; then
        apt-get install -y lsb-release
    #elif [ -x "$(command -v yum)" ]; then
    #    sudo yum install -y lsb-release
    fi
fi

user=`whoami`

distId=`lsb_release -si`
distRelease=`lsb_release -sr`
distCodename=`lsb_release -sc`

if [ "$distId" = 'Debian' -o "$distId" = 'Ubuntu' ]; then
    apt-get update
    apt-get install -y build-essential libffi-dev libssl-dev python python-dev python-setuptools git
    easy_install pip
    pip install -U jinja2 pycparser
    pip install -U ansible
fi
