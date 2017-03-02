#!/bin/bash

# custom functions
fl() {
    for i in `find $1 -type $2`;
    do ls -l $i;
    done
}

not() {
    for i in `find $1 -type f -not -name $2`;
    do ls -l $i;
    done
}


notrm() {
    find $1 -type f -not -name $2 -exec rm {} \;
}

frm() {
    find $1 -type f -name $2 -exec rm {} \;
}

# misc aliases
alias c='clear'
alias bc='bc -l'
alias rm='rm -Rf'
alias mkdir='mkdir -vp'
alias gri='grep -i'
alias lls='ls -o'
alias fl=fl
alias not=not
alias notrm=notrm
alias frm=frm
