function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

alias i="ipython"

# Run
alias sha_currentbranch="git rev-parse --short $(git rev-parse --abbrev-ref HEAD)"
alias sha_prod="git rev-parse --short production"
alias hvflake8="git diff ${sha_prod} ${sha_currentbranch} | flake8 --diff"
