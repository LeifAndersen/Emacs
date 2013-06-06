#!/usr/bin/env bash

cp .emacs ~/.emacs
cp .viper ~/.viper
cp -r .emacs.d ~/.emacs.d
cp -r .emacs.d/* ~/.emacs.d
tar xvf geiser-0.2.1.tar.gz -C ~/.emacs.d
tar xvf cedet-1.1.tar.gz -C ~/.emacs.d
tar xvf emacs-jabber-0.8.91.tar.gz -C ~/.emacs.d
tar xvf magit-1.2.0.tar.gz -C ~/.emacs.d
unzip -o nxhtml-2.08-100425.zip -d ~/.emacs.d
tar xvf ensime-master.tar.gz -C ~/.emacs.d
#tar xvf emacs-w3m-1.4.4.tar.gz -C ~/.emacs.d
tar xvf semi-1.14.6.tar.gz -C ~/.emacs.d
tar xvf apel-10.8.tar.gz -C ~/.emacs.d
tar xvf flim-1.14.9.tar.gz -C ~/.emacs.d
tar xvf dash.el.tar.gz -C ~/.emacs.d
tar xvf yasnippet.tar.gz -C ~/.emacs.d
tar xvf processing2-emacs.tar.gz -C ~/.emacs.d
cd ~/.emacs.d/cedet-1.1
make
cd ~/.emacs.d/magit-1.2.0
make
cd ~/.emacs.d/scala-mode
make
cd ~/.emacs.d/emacs-jabber-0.8.91
./configure
make
# cd ~/.emacs.d/emacs-w3m-1.4.4
# ./configure
# make
cd ~/.emacs.d/apel-10.8
make
cd ~/.emacs.d/flim-1.14.9
cd ~/.emacs.d/semi-1.14.6
