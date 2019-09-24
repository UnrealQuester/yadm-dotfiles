# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/alexander/.zshrc'

autoload -Uz compinit
autoload -Uz bashcompinit
compinit
bashcompinit
if type stack > /dev/null; then
    eval "$(stack --bash-completion-script "$(which stack)")"
fi
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
unsetopt BEEP
setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

ANTIGEN_CACHE=false
source ~/antigen.zsh
antigen use oh-my-zsh
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle robbyrussell/oh-my-zsh plugins/dirhistory
antigen bundle robbyrussell/oh-my-zsh plugins/history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
antigen apply

SPACESHIP_PROMPT_SYMBOL='❯'
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOl=""
SPACESHIP_EXEC_TIME_ELAPSED=10
SPACESHIP_DIR_COLOR=36
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  exit_code     # Exit code section
  char          # Prompt character
)

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

eval `dircolors ~/dircolors.ansi-dark`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
_comp_options+=(globdots)
setopt dotglob


autoload -U promptinit
export PATH="`ruby -e 'print Gem.user_dir'`/bin:/sbin:/usr/sbin:$HOME/.local/bin:$PATH:$HOME/.cargo/bin"

promptinit

eval "$(thefuck --alias fix)"

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^[[Z' reverse-menu-complete
# fix del key
bindkey '\e[3~' delete-char

function latexmkspeciale() {
    latexmk -shell-escape -interaction=nonstopmode -pdf -bibtex -pvc "$1"
    latexmk -c
}

alias vim="nvr -s -cc split"
alias ls="ls --color=auto"
alias :q="exit"
alias :e="vim"
alias emerge="sudo emerge -at"
alias eselect="sudo eselect"
alias ...="cd ../.."
alias vimsplit="vim -O"
alias upssh="vagrant up && vagrant ssh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
_fzf_compgen_path() {
    fd . "$1"
}

_fzf_compgen_dir() {
    fd --type d . "$1"
}

if [ -z ${NVIM_LISTEN_ADDRESS+x} ]; then
    nvr -s -c 'term'
else
    alias :q="nvr -c q"
    alias :qa="nvr -c qa"
fi

neovim_autocd() {
    [[ $NVIM_LISTEN_ADDRESS ]] && nvr -c "lcd $PWD"
}
chpwd_functions+=(neovim_autocd)
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh) || true
fi
# configure hal auto-complete
[ -f /etc/bash_completion.d/hal ] && . /etc/bash_completion.d/hal
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
