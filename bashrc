#!/bin/bash
# .bashrc

export PATH="$HOME/usr/bin:$HOME/anaconda3/bin:$HOME/bin:$PATH"

# Source global definitions
if [ -f /etc/bashrc ]; then
	  . /etc/bashrc
fi

# bring in cluster bashrc
if [ -f /common/conf/bashrc ]; then
	  . /common/conf/bashrc
fi

# bash aliass
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

alias em=emacs-25.1

# Fixes problem with emacs tramp
export PS1="[\u@\h \w ]$ "
