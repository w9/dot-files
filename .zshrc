# Path to your oh-my-zsh installation.
export ZSH=/home/xzhu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()
plugins+=(git)
plugins+=(zsh-autosuggestions)
plugins+=(zsh-syntax-highlighting)
plugins+=(zsh-completions)

# User configuration

  export PATH="/usr/bin/core_perl:/home/xzhu/.gem/ruby/2.2.0/bin/:/home/xzhu/.cabal/bin:/home/xzhu/.cabal/bin:/home/xzhu/.local/bin:/usr/local/sbin:/usr/local/game:/usr/local/bin:/usr/sbin:/usr/games:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/cuda/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

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
