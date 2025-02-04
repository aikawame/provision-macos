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

which /opt/homebrew/bin/brew > /dev/null 2>&1
if [ $? -ne 0 ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
which brew > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo ~/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
which ansible > /dev/null 2>&1
if [ $? -ne 0 ]; then
    brew install ansible
fi
