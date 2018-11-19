#!/bin/sh
# first window has 3 panes. 
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server 
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`
#
session="mill"

# set up ~/tmux
~/tmux start-server

# create a new ~/tmux session, starting vim from a saved session in the new window
~/tmux new-session -d -s $session -n maya 

# Split pane 1 horizontal by 65%, start redis-server
~/tmux splitw -h -p 50


# Select pane 0 and go to /jobs/ads
~/tmux selectp -t 1
~/tmux send-keys "cd /jobs/ads/" C-m 
~/tmux send-keys "clear" C-m

# Select pane 0 and go to /jobs/ads
~/tmux selectp -t 0
~/tmux send-keys "cd /jobs/ads/" C-m 
~/tmux send-keys "clear" C-m



# create a new window called nuke
~/tmux new-window -t $session:1 -n nuke
~/tmux send-keys "cd /jobs/ads/" C-m 
~/tmux send-keys "clear" C-m

# create a new window called org
~/tmux new-window -t $session:2 -n org
~/tmux send-keys "cd /jobs/ads/" C-m 
~/tmux send-keys "clear" C-m



# create a new window called vim
~/tmux new-window -t $session:3 -n vim
# Split pane 1 horizontal by 50%, 
~/tmux splitw -h -p 50
# Select pane 1, set dir to api, run vim
~/tmux selectp -t 0
~/tmux send-keys "cd /jobs/ads/" C-m 
~/tmux send-keys "clear" C-m
# Select pane 1, set dir to api, run vim
~/tmux selectp -t 1 
~/tmux send-keys "vim" C-m 



# return to main vim window
~/tmux select-window -t $session:0

# Finished setup, attach to the ~/tmux session!
~/tmux attach-session -t $session
