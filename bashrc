# Grant Hernandez's personal bashrc

# add my own executable directories and allow ~/bin to take precedence
export PATH="$HOME/bin:$PATH:/sbin:/usr/sbin"
export PATH="$HOME/ida-6.4/:$PATH"
export PATH="$HOME/installs/clion-1.0.5/bin:$PATH"
export PATH="$HOME/installs/idea-IC-141.1532.4/bin:$PATH"

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# global viewers
export EDITOR=/usr/bin/vim
export MANPAGER=/usr/bin/vimmanpager
# this is causing issues with Git
#export PAGER=/usr/bin/vimpager

# prevents duplicate lines from being put in the history
# and allows a leading space to hide the command from the history
export HISTCONTROL="ignoreboth"
export HISTSIZE="5000"

# append our entries to the history
shopt -s histappend

# allow for notification on completed shell jobs!
export PROMPT_COMMAND="echo -ne '\a'"

# prevent super long working directory lines
export PROMPT_DIRTRIM=4

###### Aliases ######
alias vi='vim'
alias rm='rm -I'
alias ls='ls --color=auto --group-directories-first --file-type'
alias cu='cd ..; ls'
alias mplayer='mplayer -softvol -softvol-max 900.0'
# Once more, with emphasis
alias fucking='sudo' # i.e 'fucking rm -rf /'
alias feh='feh -Z -B black -.' # fit picture and bg black
alias unsafe="source $HOME/bin/unsafe"
alias present="source $HOME/bin/present"

tbgr() { grep -r "$1" .; }

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# contain the color variables to the function
ps1_init() {
  source "$HOME/.bash_colors"
  export PS1="${MI}[${CI}\u${WI} \w ${MI}>>${NONE} "
}

ps1_init
unset ps1_init # clear the namespace

# java configuration
#_JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export _JAVA_OPTIONS="${_JAVA_OPTIONS} -Dawt.useSystemAAFontSettings=lcd"

# Add bash completion
# source /etc/profile.d/bash-completion.sh
