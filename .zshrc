export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZOXIDE_CMD_OVERRIDE="cd"

zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'hyperlink' yes
zstyle ':omz:plugins:nvm' 'lazy' yes

plugins=(
  eza
  fzf
  starship
  zoxide
  nvm
)

# alias
alias vim="nvim"
alias cat="bat"

export EDITOR="nvim"

source $ZSH/oh-my-zsh.sh

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,.next,.turbo,dist
  --preview 'bat -n --color=always {}'"
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target,.next,.turbo,dist"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# go install
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# opencode
# export PATH="$HOME/.opencode/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
