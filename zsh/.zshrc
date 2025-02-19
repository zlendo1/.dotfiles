export PATH=~/.local/scripts:$PATH
export PATH=~/.local/bin:$PATH

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Set up bat-extras
eval "$(batman --export-env)"

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color'
#alias inv='nvim $(fzf -m --preview="bat --color=always --style=numbers --line-range=:500 {}")'
alias inv='fzf -m --preview="bat --color=always --style=numbers --line-range=:500 {}" | xargs -r nvim'
alias vi='nvim'
alias vim='nvim'
alias lg='lazygit'
alias sudoedit='EDITOR=nvim sudoedit'
alias snvim='EDITOR=nvim sudoedit'

# Editor config
EDITOR='nvim'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Zinit sourcing
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit ice depth=1

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Zinit plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode

# Load completions
autoload -U compinit && compinit

# Load up oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/powerchad.toml)"

# Keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' macther-list 'm:{a-z}={A-Z-a-z}' 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Compinit once-call functionality
zinit cdreplay -q

# zsh-vi-mode timeout delay
ZVM_KEYTIMEOUT=0.2

# Bash complete
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Key management
export GPG_TTY=$(tty)
if [[ "$(cat /etc/hostname)" == "pc-home" ]]; then
  eval $(keychain --eval --quiet --quick --agents ssh,gpg id_ed25519 399A9320C64A6727)
else
  eval $(keychain --eval --quiet --quick --agents ssh,gpg id_ed25519 595CE7A6A128024A)
fi

# Tmux config specific
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi

# tmux-sessionizer binding
# bindkey -s ^f "tmux-sessionizer\n"

# kflash configuration flash
export QMK_CONF_PATH=~/Projects/dactyl-cc/qmk/handwired_dactyl_cc_programmer.json
