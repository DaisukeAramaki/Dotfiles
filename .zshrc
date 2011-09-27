#TimeZone
export TZ=Asia/Tokyo

#Colored ManPages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export PAGER=less

export PATH="/usr/local/lib/cw:$PATH"

export PATH="/usr/local/texlive/2011/bin/amd64-freebsd:$PATH"

#Colorgcc
export CC=/usr/local/bin/colorgcc

# -----/ aliases /-----
alias rm='rm'    # Interactively
alias mv='mv'    # Interactively
alias cp='cp'    # Interactively
 
alias ls='gnuls --color=auto -GF'
alias lsd='ls -dlf */'  # List directories
alias ll='ls -l'        # Detailed list
alias l='ls -laF'       # Detailed List
alias cd..='cd ..'      # Parent directory

# color grep
export GREP_COLOR=32
alias grep='grep --color'
alias egrep='egrep --color'
 
# Set an alias for `ls`
case `uname` in
	FreeBSD)
		alias ls='gnuls --color=auto -GF'
	;;
	NetBSD)
		alias ls='ls -F'
	;;
	OpenBSD)
		alias ls='ls -F'
	;;
	Linux)
		alias ls='ls --color=always -F'
	;;
esac
 
# ---------------------
# -----/ aliases /-----
#alias rm='rm'    # Interactively
#alias mv='mv'    # Interactively
#alias cp='cp'    # Interactively

#alias lsd='ls -dlf */'  # List directories
#alias ll='colorls -aG'        # Detailed list
#alias la='ls -laF'       # Detailed List
#alias cd..='cd ..'      # Parent directory
#alias l='colorls -G'    #Colored Output

# keymap

bindkey -v
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
##
## Some nice keybindings
##
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^W" backward-delete-word
bindkey "^b" backward-word
bindkey "^f" forward-word
bindkey "^d" delete-word
bindkey "^k" kill-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=3000
SAVEHIST=10000 # nice for logging
setopt extended_history
setopt share_history
function history-all { history -E 1 }


export TERM=rxvt
# path
export PATH=~/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/libexec:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin

# manpath
#export MANPATH=$MANPATH:/usr/local/man:/opt/local/share/man

# abbreviation for later use
export EDITOR=vim
export PAGER=less

# Some default extension stuff
alias mplay='mplayer -msgmodule -msgcolor -aspect 16:9'
alias -s html=opera
alias -s org=opera
alias -s php=opera
alias -s com=opera
alias -s net=opera
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s sxw=soffice
alias -s doc=soffice
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
alias -s java=vim
alias -s txt=vim
alias -s PKGBUILD=vim
alias -s se=opera
alias -s cpp=vim
alias -s sh=vim
alias -s mp3=mplay
alias -s avi=mplay
alias -s wmv=mplay
alias -s mpg=mplay
alias -s mpeg=mplay
alias -s mkv=mplay
alias -s img=mplay
alias -s iso=mplay
alias xel='xelatex -interaction=nonstopmode'
### OPTIONS ###
#setopt PROMPT_SUBST
setopt autopushd
setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt APPEND_HISTORY
# setopt AUTO_LIST		# these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME		# tries to resume command of same name
unsetopt BG_NICE		# do NOT nice bg commands
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt HASH_CMDS		# turns on hashing
setopt HIST_ALLOW_CLOBBER
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots pushdtohome cdablevars autolist
setopt   autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile

## display fancy terminal title
case $TERM in
	*rxvt*|(u)rxvt|(a|dt|k|E)term)
	## display user@host and full dir in *term title
	precmd () {
		print -Pn  "\033]0;%n@%m: %~ (%l)\007"
		#print -Pn "\033]0;%n@%m%#  %~ %l  %w :: %T\a" ## or use this
		}
	## display user@host and name of current process in *term title
	preexec () {
		print -Pn "\033]0;%n@%m <$1> %~ (%l)\007"
		#print -Pn "\033]0;%n@%m%#  <$1>  %~ %l  %w :: %T\a" ## or use this
		}
	;;
esac

# completion
autoload -U compinit
compinit
##
##  completion
##
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
# Completion Styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# list of completers to use
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# offer indexes before parameters in subscripts
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# command for process lists, the local web server details and host completion
zstyle '*' hosts $hosts
# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
#zstyle '*' single-ignored show

if [ -z "$LINES" ] || ! ( echo $LINES | grep -q '^[0-9]\+$' ) ; then
      LINES=20
fi

function maxhead() { head -n `echo $LINES - 5|bc` ; }
function maxtail() { tail -n `echo $LINES - 5|bc` ; }

# Prompt
#. ~/.zshprompt
#setprompt

# prompt line
PROMPT='%B%F{white}[%B%F{black}%~%B%F{white}]%B%F{white}--%B%F{yellow}» %f'

# zsh syntax coloring completion 
# Define the path where zsh can find live-command-coloring.sh
source ~/Dots/live-command-coloring.sh
