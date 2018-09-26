#!/bin/bash

cd src
cp -rf . ~
cd -
if [[ ! $(uname -a) =~ .*CYGWIN.* ]] ; then
    perl -p -i -e "s/PROMPT_SYMBOL='#'/PROMPT_SYMBOL='\\$'/g" ~/.bashrc
fi

source ~/.bashrc
