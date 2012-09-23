#!/bin/bash

cp .emacs ~/.emacs
cp .viper ~/.viper
tar xvf cedet-1.1.tar.gz -C ~/
cd ~/cedet-1.1
make

