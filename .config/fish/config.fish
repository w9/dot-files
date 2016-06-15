#-------------------------------------------------------------
# Base PATHs
#-------------------------------------------------------------

# This is not necessary in trusted machines
#set -x PATH

set -x PATH /bin $PATH
set -x PATH /sbin $PATH
set -x PATH /usr/bin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.cabal/bin $PATH


#------------------------------------


# This is not necessary in trusted machines
#set -x LD_LIBRARY_PATH

set -x LD_LIBRARY_PATH "/lib:$LD_LIBRARY_PATH"
set -x LD_LIBRARY_PATH "/usr/lib:$LD_LIBRARY_PATH"
set -x LD_LIBRARY_PATH "/usr/local/lib:$LD_LIBRARY_PATH"
set -x LD_LIBRARY_PATH "$HOME/.local/lib:$LD_LIBRARY_PATH"
set -x LD_LIBRARY_PATH "$HOME/.local/lib64:$LD_LIBRARY_PATH"


#------------------------------------


# This is not necessary in trusted machines
#set -x MANPATH

set -x MANPATH "/usr/local/share/man:$MANPATH"
set -x MANPATH "/usr/share/man:$MANPATH"
set -x MANPATH "$HOME/.local/share/man:$MANPATH"


#-------------------------------------------------------------
# ENV Exports
#-------------------------------------------------------------

# This is so that `screen` will use 256 colors
set -x TERM xterm-256color

set -x EDITOR vim

# Makes programs respect the `.hosts` file
set -x HOSTALIASES "$HOME/.hosts"

set -x AG_COLOR_FILENAME 'bold yellow'
set -x AG_COLOR_LINENO   'bold black'
set -x AG_COLOR_MATCH    'blue'

set -x LESS '-i -g -M -R -S'

# LESS man page colors (makes Man pages more readable).
set -x LESS_TERMCAP_mb  (set_color -o red)
set -x LESS_TERMCAP_md  (set_color -o red)
set -x LESS_TERMCAP_me  (set_color normal)
set -x LESS_TERMCAP_se  (set_color normal)
set -x LESS_TERMCAP_so  (set_color -b blue; set_color yellow)
set -x LESS_TERMCAP_ue  (set_color normal)
set -x LESS_TERMCAP_us  (set_color green)

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

alias rm! 'rm -i'
alias cp  'cp -i'
alias mv  'mv -i'

alias ..        'cd ..'
alias ...       'cd ../..'
alias ....      'cd ../../..'
alias .....     'cd ../../../..'
alias ......    'cd ../../../../..'
alias .......   'cd ../../../../../..'
alias ........  'cd ../../../../../../..'
alias ......... 'cd ../../../../../../../..'

alias h         'history'
alias lc        'wc -l'
alias ls        'ls -hF --group-directories-first --color'
alias lx        'ls -l'

alias tree      'tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t         'tree -L 1'
alias tt        'tree -L 2'
alias ttt       'tree -L 3'

alias ag  'ag --unrestricted --color-line-number="1;30" --color-match="34" --color-path="1;33"'
alias agp 'ag --pager less'

alias vi   nvim
alias ipy  ipython
alias open gnome-open
alias top  htop
alias tra  trash-put
alias run  runghc
alias pac  'sudo pacman -S'

abbr du        'du -kh'    # Makes a more readable output.
abbr df        'df -kTh'
abbr free      'free -h'

abbr R    "R --quiet --no-save"
abbr em   'emacs -nw'
abbr tmux 'tmux -2'
abbr grep 'grep --color=auto'

abbr rm   'tra'

function rp
  if [ (count $argv) = 0 ]
    realpath .
  else
    realpath $argv
  end
end

alias path      "echo \$PATH | sed 's/ /\\n/g'"
alias libpath   "echo \$LD_LIBRARY_PATH | sed 's/:/\n/g'"

alias http 'python -m http.server'

abbr gita 'git add -A .'
abbr gitl 'git pull origin master'
abbr gitc 'git commit -am commit'
abbr gitp 'git push origin master'

function fish_greeting; end

#-------------------------------------------------------------
# Source Other Files
#-------------------------------------------------------------

source $HOME/.autojump.fish

source $HOME/.config/fish/local_config.fish

