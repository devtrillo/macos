export ZSHRC=$ZDOTDIR/zshrc
source $ZSHRC

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/trillo/.bun/_bun" ] && source "/Users/trillo/.bun/_bun"

