#!/usr/bin/env bash

# =============================================================== #
#
# PERSONAL $HOME/.bashrc FILE for bash-3.0 (or later)
# By Emmanuel Rouat [no-email]
#
# Last modified: Tue Nov 20 22:04:47 CET 2012

#  This file is normally read by interactive shells only.
#+ Here is the place to define your aliases, functions and
#+ other interactive features like your prompt.
#
#  The majority of the code here assumes you are on a GNU
#+ system (most likely a Linux box) and is often based on code
#+ found on Usenet or Internet.
#
#  See for instance:
#  http://tldp.org/LDP/abs/html/index.html
#  http://www.caliban.org/bash
#  http://www.shelldorado.com/scripts/categories.html
#  http://www.dotfiles.org
#
#  The choice of colors was done for a shell with a dark background
#+ (white on black), and this is usually also suited for pure text-mode
#+ consoles (no X server available). If you use a white background,
#+ you'll have to do some other choices for readability.
#
#  This bashrc file is a bit overcrowded.
#  Remember, it is just just an example.
#  Tailor it to your needs.
#
# =============================================================== #

# --> Comments added by HOWTO author.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="$PATH:\
/home/xzhu/.local/bin:\
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
# Source global definitions (if any)
#-------------------------------------------------------------


# if [ -f /etc/bash.bashrc ]; then
#       . /etc/bash.bashrc   # --> Read /etc/bash.bashrc, if present.
# fi


#--------------------------------------------------------------
#  Automatic setting of $DISPLAY (if not set already).
#  This works for me - your mileage may vary. . . .
#  The problem is that different types of terminals give
#+ different answers to 'who am i' (rxvt in particular can be
#+ troublesome) - however this code seems to work in a majority
#+ of cases.
#--------------------------------------------------------------

# function get_xserver ()
# {
#     case $TERM in
#         xterm )
#             XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
#             # Ane-Pieter Wieringa suggests the following alternative:
#             #  I_AM=$(who am i)
#             #  SERVER=${I_AM#*(}
#             #  SERVER=${SERVER%*)}
#             XSERVER=${XSERVER%%:*}
#             ;;
#             aterm | rxvt)
#             # Find some code that works here. ...
#             ;;
#     esac
# }
# 
# if [ -z ${DISPLAY:=""} ]; then
#     get_xserver
#     if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) ||
#        ${XSERVER} == "unix" ]]; then
#           DISPLAY=":0.0"          # Display on local host.
#     else
#        DISPLAY=${XSERVER}:0.0     # Display on remote host.
#     fi
# fi
# 
# export DISPLAY

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------

# set -o nounset     # These  two options are useful for debugging.
# set -o xtrace
# alias debug="set -o nounset; set -o xtrace"
# set -o vi

# ulimit -S -c 0      # Don't want coredumps.
set -o notify         # Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt. 
# set -o noclobber    # Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files.
set -o ignoreeof      # An interactive shell will not exit upon reading EOF (CTRL-D).


# Enable options:
shopt -s cdspell            # If set, minor errors in the spelling of a directory component in a cd command will be corrected.
# shopt -s cdable_vars
# shopt -s checkhash
shopt -s checkwinsize       # If set, bash checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.
# shopt -s sourcepath
# shopt -s no_empty_cmd_completion
shopt -s cmdhist            # If set, bash attempts to save all lines of a multiple-line command in the same history entry.
# shopt -s histappend histreedit histverify
shopt -s extglob            # Necessary for programmable completion.
shopt -s dotglob
# 
# Disable options:
# shopt -u mailwarn
# unset MAILCHECK             # Don't want my shell to warn me of incoming mail.
# shopt -s autocd             # If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. This option is only used by interactive shells.
shopt -s dirspell           # If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
# shopt -s failglob           # If set, patterns which fail to match filenames during filename expansion result in an expansion error.



#-------------------------------------------------------------
# Greeting, motd etc. ...
#-------------------------------------------------------------

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.


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



echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
- DISPLAY on ${BRed}$DISPLAY${NC}\n"
date
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # Makes our day a bit more fun.... :-)
fi

function _exit()              # Function to run upon exit of shell.
{
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT

#-------------------------------------------------------------
# Shell Prompt - for many examples, see:
#       http://www.debian-administration.org/articles/205
#       http://www.askapache.com/linux/bash-power-prompt.html
#       http://tldp.org/HOWTO/Bash-Prompt-HOWTO
#       https://github.com/nojhan/liquidprompt
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


# # Test connection type:
# if [ -n "${SSH_CONNECTION}" ]; then
#     CNX=${Green}        # Connected on remote machine, via ssh (good).
# elif [[ "${DISPLAY%%:0*}" != "" ]]; then
#     CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
# else
#     CNX=${BCyan}        # Connected on local machine.
# fi
# 
# # Test user type:
# if [[ ${USER} == "root" ]]; then
#     SU=${Black}${On_Red}           # User is root.
# elif [[ ${USER} != $(logname) ]]; then
#     SU=${Red}          # User is not login user.
# else
#     SU=${Green}         # User is normal (well ... most of us are).
# fi
# 
# 
# 
# NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
# SLOAD=$(( 100*${NCPU} ))        # Small load
# MLOAD=$(( 200*${NCPU} ))        # Medium load
# XLOAD=$(( 400*${NCPU} ))        # Xlarge load
# 
# # Returns system load as percentage, i.e., '40' rather than '0.40)'.
# function load()
# {
#     local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
#     # System load of the current host.
#     echo $((10#$SYSLOAD))       # Convert to decimal.
# }
# 
# # Returns a color indicating system load.
# function load_color()
# {
#     local SYSLOAD=$(load)
#     if [ ${SYSLOAD} -gt ${XLOAD} ]; then
#         echo -en ${ALERT}
#     elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
#         echo -en ${Red}
#     elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
#         echo -en ${BRed}
#     else
#         echo -en ${Green}
#     fi
# }
# 
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
# 
# # Returns a color according to running/suspended jobs.
# function job_color()
# {
#     if [ $(jobs -s | wc -l) -gt "0" ]; then
#         echo -en ${BRed}
#     elif [ $(jobs -r | wc -l) -gt "0" ] ; then
#         echo -en ${BCyan}
#     fi
# }
# 
# # Adds some text in the terminal frame (if applicable).
# 
# 
# # Now we construct the prompt.
# PROMPT_COMMAND="history -a"
# case ${TERM} in
#   *term | xterm-256color | rxvt | linux | cygwin)
#         # Time of day (with load info):
#         PS1="\[\$(load_color)\][\A\[${NC}\] "
#         # User@Host (with connection type info):
#         PS1=${PS1}"\[${SU}\]\u\[${NC}\]${Green}@${NC}\[${CNX}\]\h\[${NC}\] "
#         # PWD (with 'disk space' info):
#         PS1=${PS1}"\[\$(disk_color)\]\W]\[${NC}\] "
#         # Prompt (with 'job' info):
#         PS1=${PS1}"\[\$(job_color)\]>\[${NC}\] "
#         # Set title of current xterm:
#         PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
#         ;;
#     *)
#         PS1="(\A \u@\h \W) > " # --> PS1="(\A \u@\h \w) > "
#                                # --> Shows full pathname of current dir.
#         ;;
# esac


# export PS1="${debian_chroot:+($debian_chroot)}\[\$(disk_color)\][\${PWD}] ${NC}$ "      # full path
export PS1="${debian_chroot:+($debian_chroot)}\[\$(disk_color)\][\w] \[${NC}\]$ "    # shorter path
# export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$"   # default
export TERM=xterm    # For my poor cygwin to fake xterm
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts
export EDITOR=/usr/bin/vim


#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================

#-------------------
# Personnal Aliases
#-------------------

alias sudo='sudo '  # let bash check next word against aliases
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
# alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -hF --color'
alias lx='ls -l --group-directories-first'         #  Sort by extension.
#alias lk='ls -lFSr'         #  Sort by size, biggest last.
#alias lt='ls -lFtr'         #  Sort by date, most recent last.
#alias lc='ls -lFtcr'        #  Sort by/show change time,most recent last.
#alias lu='ls -lFtur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
#alias ll="ls -lv --group-directories-first"
#alias lm='ll |less'        #  Pipe through 'less'
#alias lr='ll -R'           #  Recursive ls.
#alias la='ll -A'           #  Show hidden files.
alias tree='tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t='tree -L 1'
alias tt='tree -L 2'
alias ttt='tree -L 3'


#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

# alias more='less'

export PAGER=less
#export LESSCHARSET='latin1'
#export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -g -M -X -R'
#export LESS='-i -n -w -z-4 -g -M -X -R -P%t?f%f \
#:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

#alias xs='cd'
#alias vf='cd'
#alias moer='more'
#alias moew='more'
#alias kk='ll'


#-------------------------------------------------------------
# A few fun ones
#-------------------------------------------------------------

# Adds some text in the terminal frame (if applicable).

function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}


# Aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'

# .. and functions
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -a "$i"
    done
}


#-------------------------------------------------------------
# Make the following commands run in background automatically:
#-------------------------------------------------------------

function te()  # wrapper around xemacs/gnuserv
{
    if [ "$(gnuclient -batch -eval t 2>&-)" == "t" ]; then
       gnuclient -q "$@";
    else
       ( xemacs "$@" &);
    fi
}

function soffice() { command soffice "$@" & }
function firefox() { command firefox "$@" & }
function xpdf() { command xpdf "$@" & }


#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&-

}


function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o=rX "$@" ;}
function sanitize-own() { chown -R `whoami`:`whoami` "$@";}

alias sanitize='sanitize'
alias sanitize-own='sanitize-own'

#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------


function myps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { myps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }


function killps()   # kill by process name
{
    local pid pname sig="-TERM"   # default signal
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(myps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} )
    do
        pname=$(myps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}


function myip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth2 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; myip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}

#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}


function ask()          # See 'killps' for example of use.
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

function corename()   # Get name of app that created a corefile.
{
    for file ; do
        echo -n $file : ; gdb --core=$file --batch | head -1
    done
}



#=========================================================================
#
#  PROGRAMMABLE COMPLETION SECTION
#  Most are taken from the bash 2.05 documentation and from Ian McDonald's
# 'Bash completion' package (http://www.caliban.org/bash/#completion)
#  You will in fact need bash more recent then 3.0 for some features.
#
#  Note that most linux distributions now provide many completions
# 'out of the box' - however, you might need to make your own one day,
#  so I kept those here as examples.
#=========================================================================

if [ "${BASH_VERSION%.*}" \< "3.0" ]; then
    echo "You will need to upgrade to version 3.0 for full \
          programmable completion features"
    return
fi

shopt -s extglob        # Necessary.

complete -A hostname   rsh rcp telnet rlogin ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # Currently same as builtins.
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract


# Documents - Postscript,pdf,dvi.....
complete -f -o default -X '!*.+(ps|PS)'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X \
'!*.+(dvi|DVI)' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.+(pdf|PDF)' acroread pdf2ps
complete -f -o default -X '!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?\
(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
complete -f -o default -X \
'!*.+(doc|DOC|xls|XLS|ppt|PPT|sx?|SX?|csv|CSV|od?|OD?|ott|OTT)' soffice

# Multimedia
complete -f -o default -X \
'!*.+(gif|GIF|jp*g|JP*G|bmp|BMP|xpm|XPM|png|PNG)' xv gimp ee gqview
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123
complete -f -o default -X \
'!*.@(mp[23]|MP[23]|ogg|OGG|wav|WAV|pls|\
m3u|xm|mod|s[3t]m|it|mtm|ult|flac)' xmms
complete -f -o default -X '!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|\
asf|vob|VOB|bin|dat|vcd|ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|\
QT|wmv|mp3|MP3|ogg|OGG|ogm|OGM|mp4|MP4|wav|WAV|asx|ASX)' xine



complete -f -o default -X '!*.pl'  perl perl5


#  This is a 'universal' completion function - it works when commands have
#+ a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'
#  Needs the '-o' option of grep
#+ (try the commented-out version if not available).

#  First, remove '=' from completion word separators
#+ (this will allow completions like 'ls --color=auto' to work correctly).

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}


_get_longopts()
{
  #$1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
  #grep ^"$2" |sort -u ;
    $1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" |sort -u
}

_longopts()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}

    case "${cur:-*}" in
       -*)      ;;
        *)      return ;;
    esac

    case "$1" in
       \~*)     eval cmd="$1" ;;
         *)     cmd="$1" ;;
    esac
    COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode

_tar()
{
    local cur ext regex tar untar

    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    # If we want an option, return the possible long options.
    case "$cur" in
        -*)     COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
    esac

    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
        return 0
    fi

    case "${COMP_WORDS[1]}" in
        ?(-)c*f)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
        +([^Izjy])f)
            ext='tar'
            regex=$ext
            ;;
        *z*f)
            ext='tar.gz'
            regex='t\(ar\.\)\(gz\|Z\)'
            ;;
        *[Ijy]*f)
            ext='t?(ar.)bz?(2)'
            regex='t\(ar\.\)bz2\?'
            ;;
        *)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;

    esac

    if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
        # Complete on files in tar file.
        #
        # Get name of tar file from command line.
        tar=$( echo "$COMP_LINE" | \
                        sed -e 's|^.* \([^ ]*'$regex'\) .*$|\1|' )
        # Devise how to untar and list it.
        untar=t${COMP_WORDS[1]//[^Izjyf]/}

        COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
                                2>/dev/null ) )" -- "$cur" ) )
        return 0

    else
        # File completion on relevant files.
        COMPREPLY=( $( compgen -G $cur\*.$ext ) )

    fi

    return 0

}

complete -F _tar -o default tar

_make()
{
    local mdef makef makef_dir="." makef_inc gcmd cur prev i;
    COMPREPLY=();
    cur=${COMP_WORDS[COMP_CWORD]};
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in
        -*f)
            COMPREPLY=($(compgen -f $cur ));
            return 0
            ;;
    esac;
    case "$cur" in
        -*)
            COMPREPLY=($(_get_longopts $1 $cur ));
            return 0
            ;;
    esac;

    # ... make reads
    #          GNUmakefile,
    #     then makefile
    #     then Makefile ...
    if [ -f ${makef_dir}/GNUmakefile ]; then
        makef=${makef_dir}/GNUmakefile
    elif [ -f ${makef_dir}/makefile ]; then
        makef=${makef_dir}/makefile
    elif [ -f ${makef_dir}/Makefile ]; then
        makef=${makef_dir}/Makefile
    else
       makef=${makef_dir}/*.mk         # Local convention.
    fi


    #  Before we scan for targets, see if a Makefile name was
    #+ specified with -f.
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
        if [[ ${COMP_WORDS[i]} == -f ]]; then
            # eval for tilde expansion
            eval makef=${COMP_WORDS[i+1]}
            break
        fi
    done
    [ ! -f $makef ] && return 0

    # Deal with included Makefiles.
    makef_inc=$( grep -E '^-?include' $makef |
                 sed -e "s,^.* ,"$makef_dir"/," )
    for file in $makef_inc; do
        [ -f $file ] && makef="$makef $file"
    done


    #  If we have a partial word to complete, restrict completions
    #+ to matches of that word.
    if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi

    COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ \
                               {split($1,A,/ /);for(i in A)print A[i]}' \
                                $makef 2>/dev/null | eval $gcmd  ))

}

complete -F _make -X '+($*|*.[cho])' make gmake pmake




_killall()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    #  Get a list of processes
    #+ (the first sed evaluation
    #+ takes care of swapped out processes, the second
    #+ takes care of getting the basename of the process).
    COMPREPLY=( $( ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))

    return 0
}

complete -F _killall killall killps

#bind TAB:menu-complete
#bind '"^[[Z":menu-complete-backward'

function vt() {
    column -s",	" -t < $1 | less -#2 -N -S
}

# Trash support by Matt Carter <m@ttcarter.com
# Source and information: http://hash-bang.net/2009/03/trash-with-bash
# Modified by Xun Zhu <zhuxun2@gmail.com>
# Trash Tools:
#   trash FILE      trash specific file(s)
#   trash *         trash all files and directories in the directory
#   trash -f        trash all regular files in the directory
#   trash -u        undo the last action of trashing
#   trash -c        [prompt] tar the trash files to the trashbin named by a timestamp

# function trash() {
#     if [ $# == 0 ]; then
#         echo "Error: no argument found"
#         return
#     fi
#     mkdir -p ~/.trashcan/new
#     for f in "$@"
#     do
#         echo -n "Removing $f"
#         if [ -d ~/.trashcan/new/$f ]; then
#             echo "Duplicated directories are combined."
#             mv ${f}* ~/.trashcan/new/${f}
#             /bin/rm -rI $f
#         elif [ -a ~/.trashcan/new/$f ]; then
#             suf=$(date +%Y%m%d%H%M%S%N)
#             echo -n -e "\t"
#             echo -n "Duplicated file/dirctory is renamed to: ${f}.${suf}"
#             mv ~/.trashcan/new/$f ~/.trashcan/new/${f}.${suf}
#             mv --target-directory=$HOME/.trashcan/new/ -- $f
#         else
#             mv --target-directory=$HOME/.trashcan/new/ -- $f
#         fi
#         echo
#     done
# }
# 
# function clean() {
#     dir=$(date +%Y%m%d)
#     mkdir -p ${dir}
#     if [ -d new ]; then
#         echo "Moving files in new/ into ${dir}"
#         mv new/* -t  ${dir}
#     else
#         echo "The directory doesn't exist."
#     fi
# }
# 
alias "rm=trash"
#alias "emptytrash=/bin/rm -rf $HOME/.trashcan/* $HOME/.trashcan/.??*"
alias 'rm!=/bin/rm -rf'

# below are some personal aliases

alias nn="node ~/.noderc.js"
alias R="R --quiet --no-save"
#alias vl='. /home/xzhu/ss.scripts/00.view_large_table.sh'
#mkdir ~/.trashcan 2>/dev/null
alias cleantrash='now=$(date +"%m_%d_%Y")_trash; mkdir ~/.trashcan/$now; find ~/.trashcan/ -maxdepth 1 -type f -exec mv {} ~/.trashcan/$now \;'
alias editbashprofile='vim ~/.bash_profile'
alias execbashprofile='source ~/.bash_profile'
#alias python=python3
alias py='python3'
#alias vi=vim
alias lc='wc -l'
alias grep='grep --color=always'
alias vi=vim
alias getbashprofile='scp xzhu@128.171.232.58:~/.bash_profile ~/.bash_profile'
alias open=gnome-open

# solve those annoying root tmp files
function chxzhu() {
    sudo chown xzhu -R "$@"
    sudo chgrp xzhu -R "$@"
}

# set alert vlume
[ "$DISPLAY" ] && xset b 100

# make less more friendly with non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PYTHONSTARTUP=~/.pythonrc

# PATH="/usr/local/texlive/2013/bin/x86_64-linux/:$PATH"

clear

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/Softwares/android-studio/bin:$PATH"

alias ccc='ssh xzhu@rna.cc.hawaii.edu'
