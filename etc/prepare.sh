#!/bin/bash

if [ -e /private/etc/sudoers.d ]; then
    echo '既に sudoers.d ディレクトリーが存在するため、スキップします。'
else
    sudo mkdir /private/etc/sudoers.d
fi
if [ -e /private/etc/sudoers.d/staff ]; then
    echo '既に sudoers 設定が存在するため、スキップします。'
else
    sudo sh -c "echo '%staff ALL=(ALL) NOPASSWD: ALL' > /private/etc/sudoers.d/staff"
fi

which pip > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo easy_install pip
fi
which ansible > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo pip install ansible
fi
