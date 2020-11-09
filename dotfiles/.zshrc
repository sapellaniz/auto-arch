# Enable colors and change prompt
autoload -U colors && colors
PS1='%B%F{red}[%f%(?.%F{green}.%F{red})%?%f%F{red}][%f%F{yellow}%n%f%F{green}@%f%F{blue}%m%f %F{magenta}%~%f%F{red}]%f$%b'

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.config/zsh/.zcompdump
_comp_options+=(globdots)		# Include hidden files

# key bindings
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char

# Load aliases and shortcuts.
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -v'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
