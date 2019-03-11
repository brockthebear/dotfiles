# Add ``~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH"

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

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

# Change directory to the current Finder directory
# cdf to open the Finder directory in the terminal and `open .` to open in Finder
# the cwd.
function cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}

# `a` with no arguments opens the current directory in Atom Editor, otherwise
# opens the given location
function a() {
	if [ $# -eq 0 ]; then
		atom .
	else
		atom "$@"
	fi
}

# Defines transfer alias and provides easy command line file and folder sharing.
# https://gist.github.com/nl5887/a511f172d3fb3cd0e42d
if [ -e "$HOME/.transfer" ]
then
	source "$HOME/.transfer"
else
	echo "transfer function not found. make sure $HOME/.transfer exists."
fi

alias f="fork open"
alias gs='git status'
alias gaa='git add -A'
alias gdiff='git diff --color-words -w'
alias gclean='git gc --prune=now && git remote prune origin'
alias glog='git log --graph --oneline --all --decorate'
alias glogo='glog `git reflog | cut -c1-7`'
alias gstats='git shortlog --sn --all --no-merges'
alias grecent='git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"'
alias grecap='git log --all --oneline --no-merges --author=brock.boren@gmail.com'
alias goverview='git log --all --oneline --no-merges'
alias gtoday='git log --since=00:00:00 --all --no-merges --oneline --author=brock.boren@gmail.com'
alias gupstream='git log --oneline --no-merges HEAD..<remote>/<branch>'
alias glocal='git log --oneline --no-merges <remote>/<branch>..HEAD'
alias ggraph='git log --graph --all --decorate --stat --date=iso'
alias gchangelog='git log --oneline --no-merges <last tag>..HEAD'

function goops {
	git commit -a --amend
	gs
}

function gwut {
	echo "
- - - - - - - - - - - - - -
Git Convenience Shortcuts:
- - - - - - - - - - - - - -
gwut - List all Git Convenience commands and prompt symbols.
gs - git status
gaa - Add all changes (including untracted files) to staging
gc \"Message\" - Commit all new files & changes with message
goops - Add changes to previous commit & edit comessage
gp - Pull (via rebase) then push
gup - Pull (via rebase)
glog - Decorated & graphed log
glogo - As glog, including orphan commits
gdiff - A word-diff of changes with whitespace removed. Add --word-diff to show only changed words.
gclean - Compress & garbage collect data store
gstats - Summary of git log. (--since='2 weeks') can be used to limit timeframe.
grecent - See which branches you recently worked on.
grecap - See what you've been up to.
goverview - See what everyone's been up to.
gtoday - A summary of work done since midnight.
gupstream - Check which changes you're about to pull. (git log --oneline --no-merges ..origin/feature/fonts)
glocal - Check what you're about to push. This logs the commits that <remote>/<branch> needs before it resembles HEAD. (git log --oneline --no-merges origin/feature/fonts..HEAD)
ggraph - View complex logs.
gchangelog - Generate a changelog. (git log --oneline --no-merges <last tag or last commit hash>..)
- - - - - - - - - - - - - -
Prompt Symbols:
- - - - - - - - - - - - - -
The prompt shows the current branch & among other helpful things:
*  - Uncommitted changes
+  - Staged changes
%  - Untracked files
<  - You're behind the origin
>  - You're ahead of the origin
<> - You've diverged from the origin
=  - You're up-to-date with the origin
- - - - - - - - - - - - - -
"
}

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;
