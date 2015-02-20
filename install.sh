#!/usr/bin/env bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
cp -r .emacs.d/* ~/.emacs.d
cp -r include-viper.el ~/.emacs.d
tar xvf Fill-Column-Indicator.tar.gz -C ~/.emacs.d
cd ~/.emacs.d/scala-mode
make
