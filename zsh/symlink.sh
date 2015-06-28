#! /usr/bin/zsh

setopt EXTENDED_GLOB
for rcfile in prezto/runcoms/^README.md(.N); do
    ln -vs "$rcfile" ".${rcfile:t}"
done
ln -vs prezto .zprezto
unsetopt EXTENDED_GLOB
