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
# zstyle ':omz:plugins:nvm' 'lazy' yes
# zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier codex gemini npm vim

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

#vague theme
export FZF_DEFAULT_OPTS="
    --color=fg:#cdcdcd
    --color=bg:#141415
    --color=hl:#f3be7c
    --color=fg+:#aeaed1
    --color=bg+:#252530
    --color=hl+:#f3be7c
    --color=border:#606079
    --color=header:#6e94b2
    --color=gutter:#141415
    --color=spinner:#7fa563
    --color=info:#f3be7c
    --color=pointer:#aeaed1
    --color=marker:#d8647e
    --color=prompt:#bb9dbd
"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# go install
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Antigravity CLI
export PATH="$HOME/.local/bin:$PATH"
