#!/usr/bin/env bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
cp -r .emacs.d/* ~/.emacs.d
cp -r no-include-viper.el ~/.emacs.d/include-viper.el
tar xvf cedet-1.1.tar.gz -C ~/.emacs.d
tar xvf Fill-Column-Indicator.tar.gz -C ~/.emacs.d
