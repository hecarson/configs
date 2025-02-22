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

# Enable ptrace, useful for attaching with GDB
function enablept {
    sudo -E --preserve-env=PATH capsh --caps="cap_setpcap,cap_setuid,cap_setgid+ep cap_sys_ptrace+eip" --user="$USER" --addamb="cap_sys_ptrace" --shell="/usr/bin/zsh" -- -c "$*"
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mainenv='. ~/main-env/bin/activate'
alias deact='deactivate'
alias pkgsizes="pacman -Qi | grep -E '^(Name|Installed)' | awk '{gsub(/^Installed.*: /, \"\"); gsub(/Name.*: /, \"\");} {if (NR%2==1) printf \"%s \", \$0; else {gsub(\" \", \"\"); printf \"%s\n\", \$0;}}' | sort -h -k 2"
alias genmirrorlist="reflector -c us -p https -l 10 -f 5 --verbose --save mirrorlist"
alias pacdiffs="find /etc -name \"*.pacnew\" -o -name \".pacsave\" 2>& /dev/null"
alias lsfs="lsblk -o name,label,fstype,fsused,fsavail,fssize,uuid,mountpoint"

# pnpm
export PNPM_HOME="/home/carson/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
