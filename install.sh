#!/bin/bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
tar xvf geiser-0.2.1.tar.gz -C ~/
tar xvf cedet-1.1.tar.gz -C ~/
tar xvf emacs-jabber-0.8.91.tar.gz -C ~/
tar xvf magit-1.2.0.tar.gz -C ~/
cd ~/cedet-1.1
make
cd ~/magit-1.2.0
make
cd ~/emacs-jabber-0.8.91
./configure
make
