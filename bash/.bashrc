#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.git-prompt.sh

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'

alias pro='env HTTPS_PROXY=http://127.0.0.1:8889 proxychains -q'
alias c='xclip -selection clipboard'

function x() {
	7z x $1 -o$(echo $1 | awk '{sub(/\.[^.]+$/, ""); print}') 1>/dev/null
}

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias wifi='iwctl station wlan0 scan && iwctl station wlan0 get-networks && echo -n "connect: " && read wifi && iwctl station wlan0 connect $wifi'

alias gc='git clone'
alias gb='git branch'
alias gl='git log --oneline'
alias gs='git status'
alias ga='git add .'
alias gm='git commit -m'
alias gr='git reset'
alias gd='git diff'

alias dockerd='sudo dockerd --http-proxy http://localhost:8889 --https-proxy http://localhost:8889 --no-proxy localhost,127.0.0.1'
alias dr='docker run -id'
alias de='docker exec -ite LANG=zh_CN.UTF-8 -e LC_ALL=zh_CN.UTF-8'
alias dl='docker logs -f'
alias dp='docker ps -a --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'
alias di='docker image'
alias dv='docker volume'
alias dn='docker network'

alias si='makepkg -si'

alias ks='tmux kill-session -a'

alias display='xrandr --output VNC-0 --mode'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='--exact --height 70% --preview "~/.fzf-preview.sh {}"'
export FZF_COMPLETION_TRIGGER='/'

tmux &>/dev/null


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
