alias ls="ls -G"
alias brlist="fbr"
alias vim="nvim"

bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'
bind 'set completion-ignore-case on'
bind 'set show-mode-in-prompt on'

bind -m emacs '"\ee": vi-editing-mode' 

bind -m vi '"k": history-search-backward'
bind -m vi '"j": history-search-forward'
bind -m vi '"z": emacs-editing-mode'
bind -m vi '"\ee": emacs-editing-mode'

bind -m vi-insert '"\ee": emacs-editing-mode'
bind -m vi-insert '"\C-l": clear-screen'
bind -m vi-insert '"\C-e": end-of-line'
bind -m vi-insert '"\C-k": kill-modeline'

export PATH=$PATH:~/.bash/bin
export EDITOR='nvim'

# export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
# if [[ -f $THEME ]]; then
#     # export DEFAULT_USER=`whoami`
#     source $THEME
# fi
#
# prompt_context() {
#     local user=`whoami`
#
#     if [[ $USER != $DEFAULT_USER || -n $SSH_CLIENT ]]; then
#         prompt_segment black default "$USER"
#     fi
#   }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,*.swp,dist,*.coffee}/*" 2> /dev/null'
#export FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed s/^./~/"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#next two lines for ripgrep
bind -x '"\C-p": fe'

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --height 40%))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m --height 40%) &&
  cd "$dir"
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst); do 
        brew install $prog 
    done
  fi
}
