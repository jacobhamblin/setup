# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if [[ ! $TERM =~ screen ]]; then
#     exec tmux -2
# fi

[ -f ~/.terminal-config-cross-platform ] && source ~/.terminal-config-cross-platform

# fzf with ripgrep
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g
"!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

eval "$(starship init bash)"
# [[ -s "/etc/profile.d/grc.bashrc" ]] && source /etc/profile.d/grc.bashrc
