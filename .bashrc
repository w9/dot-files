#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


#-------------------------------------------------------------
# Base PATHs
#-------------------------------------------------------------

export PATH=""
export PATH="$PATH:\
$HOME/.local/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/sbin:\
/usr/bin:\
/sbin:\
/bin:\
/usr/games:\
/usr/local/games\
"



#-------------------------------------------------------------
# Bash Settings
#-------------------------------------------------------------

set -o notify         # Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt. 
set -o ignoreeof      # An interactive shell will not exit upon reading EOF (CTRL-D).

shopt -s checkwinsize       # If set, bash checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.
shopt -s cmdhist            # If set, bash attempts to save all lines of a multiple-line command in the same history entry.
shopt -s extglob            # Necessary for programmable completion.
shopt -s dotglob



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

# Current Format: [TIME USER@HOST PWD] >
# TIME:
#    Green     == machine load is low
#    Orange    == machine load is medium
#    Red       == machine load is high
#    ALERT     == machine load is very high
# USER:
#    Cyan      == normal user
#    Orange    == SU to user
#    Red       == root
# HOST:
#    Cyan      == local session
#    Green     == secured remote connection (via ssh)
#    Red       == unsecured remote connection
# PWD:
#    Green     == more than 10% free disk space
#    Orange    == less than 10% free disk space
#    ALERT     == less than 5% free disk space
#    Red       == current user does not have write privileges
#    Cyan      == current filesystem is size zero (like /proc)
# >:
#    White     == no background or suspended jobs in this shell
#    Cyan      == at least one background job in this shell
#    Orange    == at least one suspended job in this shell
#
#    Command is added to the history file each time you hit enter,
#    so it's available to all shells (using 'history -a').


# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Blue}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${Green}        # Connected on local machine.
fi

# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Black}${On_Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${Red}          # User is not login user.
else
    SU=${Green}         # User is normal (well ... most of us are).
fi



NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load

# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    # System load of the current host.
    echo $((10#$SYSLOAD))       # Convert to decimal.
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}


# Now we construct the prompt.
PROMPT_COMMAND="history -a"
case ${TERM} in
  *term | xterm-256color | rxvt | linux | cygwin | screen | screen-256color )
        PS1=""
        # Time of day (with load info):
        #PS1=${PS1}"\[\$(load_color)\][\A\[${NC}\] "
        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]\[${Green}\]@\[${NC}\]\[${CNX}\]\h\[${NC}\]\[${Green}\]:\[${NC}\]"
        # PWD (with 'disk space' info):
        PS1=${PS1}"\[\$(disk_color)\]\w\[${NC}\]"
        # Prompt (with 'job' info):
        PS1=${PS1}"\[\$(job_color)\]$\[${NC}\] "
        # Set title of current xterm:
        #PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
        ;;
    *)
        PS1="\u@\h:\w $ " 
        ;;
esac


#------------------------------------------------------------
# Aliases
#------------------------------------------------------------

alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
#alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias type='type -a'
alias ..='cd ..'
alias lc='wc -l'

alias ls='ls -hF --color'
alias lx='ls -l --group-directories-first'

alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias free='free -h'

alias tree='tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t='tree -L 1'
alias tt='tree -L 2'
alias ttt='tree -L 3'

alias R="R --quiet --no-save"
alias vim='vim'
alias vi='vim'
alias grep='grep --color=always'
alias tmux='tmux -2'

alias open='gnome-open'

alias tra='trash-put'



#-------------------------------------------------------------
# ENV Exports
#-------------------------------------------------------------

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


#-------------------------------------------------------------
# Helper functions
#-------------------------------------------------------------

function ff() { find . -type f -iname '*'"$*"'*' ; }
function fe() { find . -type f -iname '*'"${1:-}"'*' -exec ${2:-file} {} \; ; }
function fr() { grep -R --include '*.R' $* ; }

function sanitize() { sudo chmod -R u=rw,g=r,o=r,a-x+X "$@" ;}
function sanitize-own() { sudo chown -R `whoami`:`whoami` "$@";}

function pp() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function myip () { ip addr show | awk '/ inet / {print $2}' | cut -d/ -f1 ; }



#-------------------------------------------------------------
# After bash starts
#-------------------------------------------------------------

clear



#-------------------------------------------------------------
# Temporary, or added by third-party programs
#-------------------------------------------------------------

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/Softwares/android-studio/bin:$PATH"

alias ccc='ssh xzhu@rna.cc.hawaii.edu'
alias ddd='ssh zhu2@128.171.123.18'
