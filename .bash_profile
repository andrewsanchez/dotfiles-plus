if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PS1="\n[\w]\n~ $ "
export TERM=xterm-256color
export EDITOR=emacsclient

#copyq
alias cpq="/Applications/CopyQ.app/Contents/MacOS/copyq"

# Change iterm2 profile
# Usage it2prof ProfileName (case sensitive)
it2prof() {
    echo -e "\033]50;SetProfile=$1\a"
}
. /Users/$USER/miniconda3/etc/profile.d/conda.sh
conda activate

export PATH="$HOME/.cargo/bin:$PATH"
