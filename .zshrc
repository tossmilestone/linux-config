source ~/.zinit/bin/zinit.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
PYTHON_BIN=$HOME/Library/Python/3.7/bin
export PATH=$PYTHON_BIN:$HOME/bin/apiserver/bin:/usr/local/opt/coreutils/libexec/gnubin:$HOME/istio-0.7.1/bin:/usr/local/opt/postgresql@9.6/bin:$HOME/bin:$GOPATH/bin:$PATH:

if type brew &>/dev/null; then
	  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

	    autoload -Uz compinit
		  compinit
fi

# Tmux plugin settings
ZSH_TMUX_AUTOSTART=${ZSH_TMUX_AUTOSTART:-false}
if [[ "$LC_TERMINAL" == "iTerm2" ]];then
ZSH_TMUX_AUTOSTART=true
fi
ZSH_TMUX_AUTOQUIT=false

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh virtualenv user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time disk_usage ram)

ZSH_THEME_VAGRANT_PROMPT_PREFIX="%{$fg_no_bold[black]%} "
ZSH_THEME_VAGRANT_PROMPT_SUFFIX="%{$fg_no_bold[black]%}%{$reset_color%}"
ZSH_THEME_VAGRANT_PROMPT_RUNNING="%{$fg_no_bold[green]%}"
ZSH_THEME_VAGRANT_PROMPT_POWEROFF="%{$fg_no_bold[red]%}"
ZSH_THEME_VAGRANT_PROMPT_SUSPENDED="%{$fg_no_bold[black]%}"
ZSH_THEME_VAGRANT_PROMPT_NOT_CREATED="%{$fg_no_bold[white]%}○"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  iterm2
  osx
  ssh
  docker
  tmux
  vagrant
  #vagrant-prompt
  wakatime
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NO_PROXY="127.0.0.1"
alias vi="vim"
alias ls="ls --color=always"
alias fgwall="source ~/proxy"
alias fgalauda="source ~/proxy-alauda"
alias bgwall="unset HTTP_PROXY HTTPS_PROXY ALL_PROXY"
alias bgalauda="bgwall"
alias yml2json="python -c 'import sys, yaml, json; y=yaml.safe_load(sys.stdin.read()); print json.dumps(y, indent=4)'"
alias json2yml="python -c 'import sys, yaml, json; y=json.load(sys.stdin); print yaml.safe_dump(y)'"
alias gru=" git fetch origin && git rebase origin/master"
alias gnw="git fetch origin && git checkout origin/master -b"
alias gap="git commit --amend --no-edit && git push -f"
alias sshj="ssh jump -tt ssh"
export POWERLINE_COMMAND=powerline
zstyle ':completion:*' rehash true

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
GITSTATUS_ENABLE_LOGGING=1
GITSTATUS_DAEMON_LOG_POWERLEVEL9K=/tmp/gitstatusd.log

#source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.fonts/*.sh

zinit for \
 light-mode zdharma/history-search-multi-word \
  zsh-users/zsh-autosuggestions \
  zdharma/fast-syntax-highlighting
zinit ice as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit ice as"program" src"$HOME/.p10k.zsh"
zinit light romkatv/powerlevel10k
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# Make short hostname only if its not an IP address
#__tm_get_hostname(){
    #local HOST="$(echo $* | cut -d ' ' -f 2)"
    #if echo $HOST | grep -E "^([0-9]+\.){3}[0-9]+" -q; then
        #echo $HOST
    #else
        #echo $HOST| cut -d . -f 1
    #fi
#}

#__tm_get_current_window(){
    #tmux list-windows| awk -F : '/\(active\)$/{print $1}'
#}

# Rename window according to __tm_get_hostname and then restore it after the command
#__tm_command() {
    #if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=| cut -d : -f 1)" = "tmux" ]; then
        #__tm_window=$(__tm_get_current_window)
        ## Use current window to change back the setting. If not it will be applied to the active window
        #tmux rename-window "$(__tm_get_hostname $*)"
    #fi
    #command "$@"
    #tmux set-window-option -t $__tm_window automatic-rename on 1>/dev/null
#}

#ssh() {
    #__tm_command ssh "$@"
#}

#ec2ssh() {
    #__tm_command ec2ssh "$@"
#}

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export PATH="$HOME/Library/Python/2.7/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:/usr/local/kubebuilder/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$(go env GOROOT)/misc/wasm:$PATH"
#source ~/.minikube-completion
alias kcalico="kubectl --context=calico"
alias kovn="kubectl --context=ovn"
alias kglobal="kubectl --context=global"
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit
compdef kglobal=kubectl
compdef kcalico=kubectl
compdef kovn=kubectl


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
