#-------------------------------------------------------------
# Base PATHs
#-------------------------------------------------------------

# This is not necessary in trusted machines
#set -x PATH

set -x PATH /bin $PATH
set -x PATH /sbin $PATH
set -x PATH /usr/bin $PATH
set -x PATH /usr/games $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/game $PATH
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

set -x AG_COLOR_FILENAME 'bold white'
set -x AG_COLOR_LINENO   'bold black'
set -x AG_COLOR_MATCH    'blue'

alias ag  'ag --unrestricted --group --color --color-line-number="1;30" --color-match="34" --color-path="1;37"'
alias agp 'ag --pager "less -i -g -M -X -R -S"'

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

alias rm!       '/bin/rm -i'
alias cp        'cp -i'
alias mv        'mv -i'

alias h         'history'
alias ..        'cd ..'
alias ...       'cd ../..'
alias ....      'cd ../../..'
alias .....     'cd ../../../..'
alias ......    'cd ../../../../..'
alias .......   'cd ../../../../../..'
alias ........  'cd ../../../../../../..'
alias ......... 'cd ../../../../../../../..'
alias lc        'wc -l'

alias ls        'ls -hF --group-directories-first --color'
alias lx        'ls -l'

alias path      "echo \$PATH | sed 's/ /\\n/g'"
alias libpath   "echo \$LD_LIBRARY_PATH | sed 's/:/\n/g'"

alias du        'du -kh'    # Makes a more readable output.
alias df        'df -kTh'
alias free      'free -h'

alias tree      'tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t         'tree -L 1'
alias tt        'tree -L 2'
alias ttt       'tree -L 3'

alias R    "R --quiet --no-save"
alias em   'emacs -nw'
alias tmux 'tmux -2'
alias grep 'grep --color=always'
alias less 'less -i -g -M -X -R -S'

alias vi   nvim
alias open gnome-open
alias top  htop
alias tra  trash-put
alias run  runghc

function rp
  if [ (count $argv) = 0 ]
    realpath .
  else
    realpath $argv
  end
end

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
