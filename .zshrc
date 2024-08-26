# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/carson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall



bindkey "^?" backward-delete-char

setopt autocd

# autoload -Uz promptinit
# promptinit
# prompt suse
PS1="%{%F{green}%}%D{%H:%M:%S} %{%B%F{red}%}%n@%m%{%b%F{white}%}:%{%F{yellow}%}%~ %{%F{white}%}> "
PS2="> "

export EDITOR=nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mainenv='. ~/main-env/bin/activate'
alias deact='deactivate'
alias pkgsize="pacman -Qi | grep -E '^(Name|Installed)' | awk '{gsub(/^Installed.*: /, \"\"); gsub(/Name.*: /, \"\");} {if (NR%2==1) printf \"%s \", \$0; else {gsub(\" \", \"\"); printf \"%s\n\", \$0;}}' | sort -h -k 2"
