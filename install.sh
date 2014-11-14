#!/usr/bin/env bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
cp -r .emacs.d/* ~/.emacs.d
cp -r include-viper.el ~/.emacs.d
tar xvf cedet-1.1.tar.gz -C ~/.emacs.d
tar xvf Fill-Column-Indicator.tar.gz -C ~/.emacs.d
cd ~/.emacs.d/cedet-1.1
make
cd ~/.emacs.d/scala-mode
make
