# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt, ou pas ... [RST]
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -Al'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi





#-----------------------------------------RST's-modif----------------------------------------
couleur_success="$(tput setaf 2)"
couleur_failure="$(tput setaf 1)"
couleur_normale="$(tput sgr0)"
couleur_base="$(tput setaf 7)"
couleur_unam="$(tput setaf 3)"
couleur_poste="$(tput setaf 37)"
couleur_path="$(tput setaf 28)"

function err_display()
{
    local err=$?
    echo
    if [ $err -ne 0 ] ;
    then
        echo "$couleur_base┌[$couleur_failure×$err×$couleur_base]"
    else
        echo "$couleur_base┌[$couleur_success√$couleur_base]"
    fi
}

PROMPT_COMMAND="err_display"
PS1="\[\033[0;37m\]├─[\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h\[\033[0;37m\]]─[pts\l]─[\j%]\n├─[\t]─[\[\033[0;32m\]\w\[\033[0;37m\]]\n└─> \[\033[0m\]"
#\[\033[0;37m\] base
#\[\033[0;33m\] unam
#\[\033[0;96m\] post
#\[\033[0;32m\] path
#\[\033[0;1m\] failure
#\[\033[0;28m\] success
#\[\033[0m\]    normale
# NE PAS UTILISER HORS DE LA FONCTION ! sinon err ecriture tampon mal temporisé
PS2="\[\033[0;37m\]└──> \[\033[0m\]"



man()
{
  env LESS_TERMCAP_mb=$'\E[01;31m'   \
  LESS_TERMCAP_md=$'\E[01;38;5;74m'  \
  LESS_TERMCAP_me=$'\E[0m'           \
  LESS_TERMCAP_se=$'\E[0m'           \
  LESS_TERMCAP_so=$'\E[38;5;246m'    \
  LESS_TERMCAP_ue=$'\E[0m'           \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}



#la secuurité ...
alias rm='rm -i'

#les vars bien utiles
export MONITOR=$(polybar --list-monitors 2>/dev/null | cut -f1 -d':'| head -n 1)
export WIRELESS=$(ip link | cut -f2 -d':' | grep wl | tr -d ' ' | head -n 1)
export WIRELESS2=$(ip link | cut -f2 -d':' | grep wl | tr -d ' ' | tail -n 1 | grep -vE ^$WIRELESS$)
export WIRED=$(ip link | cut -f2 -d':' | grep en | tr -d ' ' | head -n 1)
export WIRED2=$(ip link | cut -f2 -d':' | grep en | tr -d ' ' | tail -n 1 | grep -vE ^$WIRED$)

#memoriel le temps de prendre la main
alias nano='echo "tu voulait dire micro non ?"'
alias music='ncmpcpp'

#le curseur qui va bien
echo -ne "\033[5 q"
screenfetch
#-------------------------------------------------------------------------------------------

