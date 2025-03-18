#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.git-prompt.sh

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias mount='sudo mount -o uid=$(id -u $USER),gid=$(id -g $USER)'

alias pro='proxychains -q'
alias c='xclip -selection clipboard'

function ss() {
    case $1 in
        seturl)
            echo "$2" > ~/.config/shadowsocks/ssurl
            ;;
        update)
            rm -rf ~/.config/shadowsocks/list/
            ~/.config/shadowsocks/update.sh
            ;;
        start)
            sslocal -c "$2"
            ;;
    esac
}

function x() {
	7z x $1 -o$(echo $1 | awk '{sub(/\.[^.]+$/, ""); print}') 1>/dev/null
}

# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias wifi='iwctl station wlan0 scan && iwctl station wlan0 get-networks && echo -n "connect: " && read wifi && iwctl station wlan0 connect $wifi'

alias gc='git clone'
alias gb='git branch'
alias gl='git log --graph --all --decorate'
alias gs='git status'
alias ga='git add .'
alias gm='git commit -m'
alias gr='git reset'
alias gd='git diff'

alias dockerd='sudo dockerd --http-proxy socks5://localhost:1080 --https-proxy socks5://localhost:1080 --no-proxy localhost,127.0.0.1'
alias dr='docker run -id'
alias de='docker exec -ite LANG=zh_CN.UTF-8 -e LC_ALL=zh_CN.UTF-8'
alias dl='docker logs -f'
alias dp='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias di='docker image'
alias dv='docker volume'
alias dn='docker network'

alias si='makepkg -si'

alias display='xrandr --output VNC-0 --mode'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='--exact --height 70% --preview "~/.fzf-preview.sh {}"'
export FZF_COMPLETION_TRIGGER='/'

PS1='\n┏$(__git_ps1 "\[\e[30;41;1m\][%s]\[\e[0m\]\n┣")\[\e[35;1m\][\w]\[\e[0m\]\n┗━✡ '


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/yuxing/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/yuxing/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/yuxing/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/yuxing/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
# 
# export PATH=$PATH:/home/yuxing/anaconda3/bin
# alias python='/home/yuxing/anaconda3/envs/pytorch1.6/bin/python3.12'
# conda activate pytorch1.6


source /usr/share/nvm/init-nvm.sh
nvm use system &>/dev/null

alias ks='tmux kill-session -a'

if [ -z $TMUX ]; then
	session=$(tmux ls | grep -v "(attached)" | cut -d : -f 1 | tail -1)
	if [ -z $session ]; then
		sessions=($(tmux ls | cut -d : -f 1))
		if [ ${#sessions[@]} -eq $(expr ${sessions[-1]} + 1) ]; then
			tmux new-session -s ${#sessions[@]}
		else
			session=0
			for i in $sessions; do
				if [ $i -eq $session ]; then
					((session++))
				else
					break
				fi
			done
			tmux new-session -s $session
		fi
	else
		tmux attach-session -t $session
	fi
fi

# eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fk)

[[ $XDGSESSION = 'x11' ]] & xset r rate 200 60

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
