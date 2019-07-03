#!/bin/bash

# custom functions
fl() {
    for i in `find $1 -type $2`;
    do ls -l $i;
    done
}
alias fl=fl

not() {
    for i in `find $1 -type f -not -name $2`;
    do ls -l $i;
    done
}
alias not=not


notrm() {
    find $1 -type f -not -name $2 -exec rm {} \;
}
alias notrm=notrm

frm() {
    find $1 -type f -name $2 -exec rm {} \;
}
alias frm=frm

# misc aliases
alias c='clear'
alias bc='bc -l'
alias rm='rm -Rf'
alias mkdir='mkdir -vp'
alias gri='grep -i'
alias lls='ls -o'
