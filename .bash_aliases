# Allow aliases when using sudo. Space at end is needed.
# http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# List hidden files only
alias lh='ls -lad .*'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
 alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\''), is finished"'

#pushbullet alert for long running commands. Use like so:
# sleep 10; pa
 alias pa='pushbullet push all note "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*pa$//'\''), is finished. from $(whoami)@$(hostname)"'

# Alias to allow us to quickly edit or  change the folder and file permissions to work on the settings.php file in a drupal install. Run from Drupal webroot.
alias opensesame='chmod  +w  sites/default/settings.php sites/default/'
alias closesesame='chmod -w sites/default/settings.php sites/default/'
alias ali-baba='nano sites/default/settings.php'
