#!/bin/bash
# ~/.bash_profile
# mantained by 1noro for the purpose of personal use

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
