#!/bin/zsh

SESSIONNAME="build"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
 then
    tmux new-session -s $SESSIONNAME -n builds -d
    tmux split-window -v
    tmux select-pane -t 0
    tmux send-keys "cd ~/prog/lego-webapp && clear" C-m
    tmux select-pane -t 1
    tmux send-keys "cd ~/prog/lego && clear" C-m
fi

tmux attach -t $SESSIONNAME
