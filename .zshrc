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
export ZSH=/home/xzhu/.oh-my-zsh


#-------------------------------------------------------------
# Oh-My-Zsh
#-------------------------------------------------------------

ZSH_THEME="zx"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=()
plugins+=(git)
plugins+=(zsh-autosuggestions)
plugins+=(zsh-syntax-highlighting)
plugins+=(zsh-completions)


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias rm='rm -i'
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
alias top='htop'

alias tree='tree -CF'    #  Nice alternative to 'recursive ls' ...
alias t='tree -L 1'
alias tt='tree -L 2'
alias ttt='tree -L 3'

alias R="R --quiet --no-save"
alias vi='nvim'
alias em='emacs -nw'
alias tmux='tmux -2'
alias grep='grep --color=always'

alias open='gnome-open'

alias tra='trash-put'
alias fr="grep -R --include '*.R'"

alias gitl='git pull origin master'
alias gitc='git commit -am commit'
alias gitp='git push origin master'
alias gita='git add -A .'

# print all 256 color and their code for reference
alias 256='( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )'

alias run=runghc



export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black'
export ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
export ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
export ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
export ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
export ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'


source /usr/share/doc/pkgfile/command-not-found.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
