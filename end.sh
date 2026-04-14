#!/bin/bash
# Gracefully quit all neovim sessions without saving before killing the tmux session.
# This prevents swap files from being left behind.

SESSION="walkthrough"

# Send Escape + :qa! to every tmux pane in the session that is running nvim
for pane in $(tmux list-panes -s -t "$SESSION" -F '#{pane_id}' 2>/dev/null); do
    pane_cmd=$(tmux display-message -p -t "$pane" '#{pane_current_command}')
    if [[ "$pane_cmd" == "nvim" || "$pane_cmd" == "vim" ]]; then
        tmux send-keys -t "$pane" Escape
        tmux send-keys -t "$pane" ':qa!' Enter
    fi
done

# Give neovim a moment to exit cleanly
sleep 1

# Kill the tmux session
tmux kill-session -t "$SESSION" 2>/dev/null
