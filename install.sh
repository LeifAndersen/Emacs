#!/bin/bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp .emacs.d ~/.emacs.d
tar xvf geiser-0.2.1.tar.gz -C ~/
tar xvf cedet-1.1.tar.gz -C ~/
cd ~/cedet-1.1
make

