[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf with ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g
"!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# bind -x '"\C-p": vim $(fzf);'

[ -f ~/.terminal-config-cross-platform ] && source ~/.terminal-config-cross-platform

alias install_req='docker-compose exec app pip install -r ../requirements.txt'

b_frontend() {
  docker-compose stop frontend
  chown jacob:jacob -R theme/static
  gulp dev
}

tmux

eval "$(starship init zsh)"
[[ -s "/etc/profile.d/grc.zsh" ]] && source /etc/profile.d/grc.zsh
