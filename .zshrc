# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Path to your oh-my-zsh installation.
export ZSH="/Users/brockboren/.oh-my-zsh"

# https://github.com/larkery/zsh-histdb
HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

# Disable confirmation when using `rm`
setopt rmstarsilent

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# autoload -U promptinit; promptinit
# prompt spaceship

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	alias-finder
  autojump
  battery
  brew
  colored-man-pages
  colorize
  command-not-found
  common-aliases
  cp
  dotenv
  forklift
  frontend-search
  gatsby
  git
	git-aliases
  git-extras
	git-it-on
  git-prompt
  gitignore
	jsontools
	last-working-dir
  macos
  node
  npm
  nvm
  pip
  python
	sudo
  thefuck
  themes
  virtualenv
  yarn
  z
	zsh-autosuggestions
  zsh-interactive-cd
	zsh-syntax-highlighting
)

ZSH_DOTENV_PROMPT=false

source $ZSH/oh-my-zsh.sh

# source /Users/brockboren/.rvm/scripts/rvm

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Enable tab completion for colorls
# https://github.com/athityakumar/colorls#installation
# source $(dirname $(gem which colorls))/tab_complete.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias h="history"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Optimize all images in a folder
alias optimize='image_optim *.{jpg,png,gif,svg}'

# Get week number
alias week='date +%V'

# brew doctor
alias brewdoc='brew doctor'

# update homebrew
alias brewup='brew update'

# list outdated homebrew packages
alias brewout='brew outdated'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Use trash-cli to move deleted files to the trash instead of permanently deleting them.
alias rm="trash"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Find CPU hogs
alias mem_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Show party parrot in terminal.
alias party='curl parrot.live'

# Watch Star Wars in ASCII.
# If telnet is not installed, run `brew install telnet` on macOS.
alias starwars='telnet towel.blinkenlights.nl'

# Turn the terminal-screen into matrix-style gibberish.
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

alias venv="source ./venv/bin/activate"
alias py="python3"
# alias lc='colorls -lA --sd'
# alias la='colorls -lA --sd'
# alias ltree='colorls -lrtA --sf --tree'
# alias lstat='colorls -lA --sd --report'
# alias lgst='colorls -lA --sf --git-status'

unset zle_bracketed_paste

# Disable confirmation when using `rm`
setopt rmstarsilent

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$PATH:$(ruby -e 'puts Gem.bindir')

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Enable tab completion for colorls
# https://github.com/athityakumar/colorls#installation
source $(dirname $(gem which colorls))/tab_complete.sh

SPACESHIP_PROMPT_ORDER=(
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  # package       # Package version
  # ruby          # Ruby section
  # golang        # Go section
  php           # PHP section
  # docker        # Docker section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# SPACESHIP_RPROMPT_ORDER=(
#   # battery
#   time
# )

# RPROMPT='$(battery_pct_prompt)'

# PROMPT
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR='#FF1493'


SPACESHIP_DIR_COLOR='#40E0D0'

SPACESHIP_EXIT_CODE_SHOW="true"

SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE=true}"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="${SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false}"
SPACESHIP_PROMPT_PREFIXES_SHOW="${SPACESHIP_PROMPT_PREFIXES_SHOW=true}"
SPACESHIP_PROMPT_SUFFIXES_SHOW="${SPACESHIP_PROMPT_SUFFIXES_SHOW=true}"
SPACESHIP_PROMPT_DEFAULT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX="via "}"
SPACESHIP_PROMPT_DEFAULT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "}"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW='true'

SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_TIME_SHOW="false"
SPACESHIP_TIME_12HR="true"

SPACESHIP_HOST_COLOR_SSH="#00FF7F"

SPACESHIP_GIT_STATUS_COLOR="#DC143C"
SPACESHIP_GIT_SYMBOL=" \UE702 "
SPACESHIP_GIT_STATUS_ADDED="%F{yellow} +%F{red}"
SPACESHIP_GIT_STATUS_UNTRACKED="%F{blue} ? %F{red}"
SPACESHIP_GIT_STATUS_DELETED="%F{green} x %F{red}"
SPACESHIP_GIT_STATUS_MODIFIED="%F{red} ! %F{red}"
SPACESHIP_GIT_STATUS_RENAMED="${SPACESHIP_GIT_STATUS_RENAMED="»"}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED="$"}"
SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED="="}"
SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD="⇡"}"
SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND="⇣"}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED="⇕"}"

# NODE
# SPACESHIP_NODE_PREFIX=" "
SPACESHIP_NODE_SUFFIX=" "
SPACESHIP_NODE_SYMBOL="\UE79B  "
SPACESHIP_NODE_COLOR="#00FA99"

SPACESHIP_VENV_COLOR='#87ff5f'
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "
# SPACESHIP_VENV_GENERIC_NAMES='(.venv)'

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://starship.rs/config/#prompt
eval "$(starship init zsh)"
