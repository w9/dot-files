#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

#-------------------------------------------------------------
# Base PATHs
#-------------------------------------------------------------

export PATH=""
export PATH="/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/games:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/game:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


#------------------------------------


export LD_LIBRARY_PATH=""
export LD_LIBRARY_PATH="/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib64:$LD_LIBRARY_PATH"


#------------------------------------


export MANPATH=""
export MANPATH="/usr/local/share/man:$MANPATH"
export MANPATH="/usr/share/man:$MANPATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"


#-------------------------------------------------------------
# ENV Exports
#-------------------------------------------------------------

# This is so that `screen` will use 256 colors
export TERM=xterm-256color

export EDITOR=vim

# Makes programs respect the `.hosts` file
export HOSTALIASES="$HOME/.hosts"

export LESS='-i -g -M -X -R -S'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#export TERM=xterm    # For my poor cygwin to fake xterm
#export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
#export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts
#export EDITOR=/usr/bin/vim

unset SSH_ASKPASS


#-------------------------------------------------------------
# Bash Settings
#-------------------------------------------------------------

set -o notify         # Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt. 
set -o ignoreeof      # An interactive shell will not exit upon reading EOF (CTRL-D).

shopt -s checkwinsize       # If set, bash checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.
shopt -s cmdhist            # If set, bash attempts to save all lines of a multiple-line command in the same history entry.
shopt -s extglob            # Necessary for programmable completion.
shopt -s dotglob

stty -ixon



#-------------------------------------------------------------
# Color Definition
#-------------------------------------------------------------

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background



#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------

export PS1="\u@\h \w \$ "


#------------------------------------------------------------
# Aliases
#------------------------------------------------------------

alias rm!='/bin/rm -i'
alias cp='cp -i'
alias mv='mv -i'
#alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias type='type -a'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias lc='wc -l'

alias ls='ls -hF --group-directories-first --color'
alias lx='ls -l'

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias free='free -h'
#alias top='htop'

alias tree='tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t='tree -L 1'
alias tt='tree -L 2'
alias ttt='tree -L 3'

alias R="R --quiet --no-save"
alias vi='nvim'
alias em='emacs -nw'
alias tmux='tmux -2'

alias open='gnome-open'

alias tra='trash-put'
alias fr="grep -R --include '*.R'"

alias gitl='git pull origin master'
alias gita='git add .'
alias gitc='git commit -am commit'
alias gitp='git push origin master'
alias gitacp='gita && gitc && gitp'

# print all 256 color and their code for reference
alias 256='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'

alias run=runghc


#-------------------------------------------------------------
# Helper functions
#-------------------------------------------------------------

function ff() { find . -type f -iname '*'"$*"'*' ; }
function fe() { find . -type f -iname '*'"${1:-}"'*' -exec ${2:-file} {} \; ; }

function sanitize() { sudo chmod -R u=rw,g=r,o=r,a-x+X "$@" ;}
function sanitize-own() { sudo chown -R `whoami`:`whoami` "$@";}

function pp() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function myip () { ip addr show | awk '/ inet / {print $2}' | cut -d/ -f1 ; }

function vir () { tmux -2 new "vim --servername VIM $*" ; }

# This gives a convenient way of printing the full directory of a file
function pwd () { if [ -z "$1" ]; then echo $PWD; else echo $PWD/$1; fi; }
complete -f pwd

function ctagsc() {
  g++ -M `find . -name '*.cpp' -or -name '*.h' | xargs` | sed -e 's/[\\ ]/\n/g' | sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
}



#-------------------------------------------------------------
# After bash starts
#-------------------------------------------------------------

shopt -q login_shell && clear

#-------------------------------------------------------------
# Source Bashmarks if exists
#-------------------------------------------------------------

if [ -f "$HOME/.local/bin/bashmarks.sh" ]; then
  source $HOME/.local/bin/bashmarks.sh
fi

#-------------------------------------------------------------
# Run machine specific script if exists
#-------------------------------------------------------------

if [ -f "$HOME/.bashrc_local" ]; then
  source "$HOME/.bashrc_local"
fi


#-------------------------------------------------------------
# "command-not-found" script
#-------------------------------------------------------------

if [ -f  "/usr/share/doc/pkgfile/command-not-found.bash" ]; then
  source "/usr/share/doc/pkgfile/command-not-found.bash"
fi
