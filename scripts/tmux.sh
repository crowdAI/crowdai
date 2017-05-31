#!/bin/bash
CURRENT_SESSION=${PWD##*/}

tmux new-session -d -s $CURRENT_SESSION

# VIM
tmux send-keys 'vim' 'C-m'
tmux rename-window vim

# Rspec
tmux new-window
tmux rename-window rspec

# terminal
tmux new-window
tmux rename-window term

# Rails Server
tmux new-window
tmux rename-window server
tmux send-keys 'rails s' 'C-m'

tmux select-window -t 1

tmux attach -t $CURRENT_SESSION
