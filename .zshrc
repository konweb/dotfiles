# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"
ZSH_THEME="dst"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="jtriley"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

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
plugins=(my-env atom autojump brew brew-cask bundler cdd colored-man composer docker encode64 gem git homeshick pow rails rake rbenv tig tmux vagrant web-search zsh-syntax-highlighting)

# cd-bookmark
fpath=(/Users/maboroshi_kondou/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

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

export EDITOR=vim
# export EDITOR='subl'
# export EDITOR='atom'
# export EDITOR='coda'
# export PATH=/usr/local/bin:$PATH
# export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# for shortcut
alias ls="ls -G -A"
# alias gulp="gulp --require coffee-script/register"
alias server="python -m SimpleHTTPServer"
alias mm="middleman"
alias br="brew"
alias brup="brew update && brew upgrade"
alias brc="brew cask"
alias brcup="brew cask cleanup && brew file cask_upgrade -C"
alias va="vagrant"
alias ple="pleeease"
alias wp-setup="curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash -s"
alias wm="wordmove"
alias gbs="java -jar /usr/local/opt/gitbucket/libexec/gitbucket.war"

# for svn
alias svn='colorsvn'
alias sst='svn st -u'
alias sad='svn add'
alias sup='svn up'
alias sci='svn ci'
alias sco='svn co'
alias sin='svn info'
alias sme='svn merge'
alias sre='svn revert'
alias sdl='svn del'

# others
alias cdb='cd-bookmark'
alias ssh-config-update="cat ~/.ssh/conf/*.conf > ~/.ssh/config"

# autojump
[[ -s /Users/maboroshi_kondou/.autojump/etc/profile.d/autojump.sh ]] && source /Users/maboroshi_kondou/.autojump/etc/profile.d/autojump.sh

# svn log limit
sl(){
	svn log -l $1 -v
}

# svn diff
sdi(){
	svn diff -x --ignore-eol-style $1 | vim -R -
}
# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

function git_diff_zip() {
	local diff=""
	local h="HEAD"
	if [ $# -eq 1 ]; then
		if expr "$1" : '[0-9]*$' > /dev/null ; then
			diff="HEAD HEAD~${1}"
		else
			diff="HEAD ${1}"
		fi
	elif [ $# -eq 2 ]; then
		diff="${1} ${2}"
		h=$1
	fi
	if [ "$diff" != "" ]; then
		diff="git diff --diff-filter=D --name-only ${diff}"
	fi
	git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}

function git_diff_tag_zip() {
	git archive --format=zip --prefix=root/ $1 `git diff --name-only ${2} ${1}` -o ./hoge.zip
}
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"


# fzf setting
	# fzf options
	export FZF_DEFAULT_OPTS='--reverse'

	# fzf history shortcut
	function select-history() {
		BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
		CURSOR=$#BUFFER
	}
	zle -N select-history
	bindkey '^r' select-history
