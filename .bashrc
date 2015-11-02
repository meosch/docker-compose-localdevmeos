# .bash_profile vs .bashrc
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true

# don't put lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load the git-prompt script so we can see what branch we are on.
source ~/bin/.git-prompt.sh

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

function parse_git_branch(){
    git_dir=$(git rev-parse --git-dir 2>/dev/null)
    if [ -n "$git_dir" ]; then
      fish_git_dirty_color='\e[0;31m' # Red
      fish_git_not_dirty_color='\e[0;32m' # Green
      gitbranch=$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
      git_diff=$(git diff 2>/dev/null)
        if [ -z "$git_diff" ]; then
          printf "$fish_git_not_dirty_color"
        else
          printf "$fish_git_dirty_color"
        fi 
    fi


}

set_bash_prompt(){
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ -n "${VIRTUAL_HOST}" ]; then
  virtualhostmarker=" "
else
  virtualhost=""
fi
if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='[\[\033[01;33m\]\d \[\033[01;37m\]\t \[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]$(parse_git_branch)$(__git_ps1) \[\033[00m\]$ '
PS1='[\[\033[01;33m\]\d \[\033[01;37m\]\t \[\033[01;36m\]\u@\h\[\033[00m\]\[\033[01;37m\]${virtualhostmarker}\[\033[00;37m\]\[\033[04;34m\]${VIRTUAL_HOST}\[\033[00;34m\]\[\033[01;34m\]:\w\[\033[00m\]\[\033[1;35m\]$(__git_ps1) \[\033[00m\]$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="[\d \t \u@\h \${VIRTUAL_HOST}:\w \$(__git_ps1)] $ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# Disabled for servers for more info on rbenv see: https://github.com/sstephenson/rbenv
#eval "$(rbenv init -)"

# Part of keyboard/terminal bell fix
[ "$DISPLAY" ] && xset b 100

# Add some neat bash completion to drush commands
    if [ -f ~/.drush.bashrc ] ; then
        . ~/.drush.bashrc
    fi
