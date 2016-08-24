#!/bin/bash

remote_we_loc="/usr/local/apache2/htdocs/cs/wags/***Your_Name***/we"
local_we_loc="/home/***Your_Name***/workspace/Wags_Client/war/we"

if [[ $# == 0 ]]; then
    echo "usage: $0 username [local-path]"
    exit 1
elif [[ $# == 2 ]]; then
    local_we_loc=$2
fi

username=$1

ssh $username@cs.appstate.edu "rm -rf $remote_we_loc"
scp -qr $local_we_loc $username@cs.appstate.edu:$remote_we_loc
echo "done"
