#!/usr/bin/env bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
cp -r .emacs.d/* ~/.emacs.d
cp -r include-viper.el ~/.emacs.d
tar xvf cedet-1.1.tar.gz -C ~/.emacs.d
unzip -o nxhtml-2.08-100425.zip -d ~/.emacs.d
tar xvf ensime-master.tar.gz -C ~/.emacs.d
tar xvf semi-1.14.6.tar.gz -C ~/.emacs.d
tar xvf apel-10.8.tar.gz -C ~/.emacs.d
tar xvf flim-1.14.9.tar.gz -C ~/.emacs.d
tar xvf Fill-Column-Indicator.tar.gz -C ~/.emacs.d
cd ~/.emacs.d/cedet-1.1
make
cd ~/.emacs.d/scala-mode
make
cd ~/.emacs.d/apel-10.8
make
cd ~/.emacs.d/flim-1.14.9
cd ~/.emacs.d/semi-1.14.6
