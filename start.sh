#!/usr/bin/env bash
set -euo pipefail

SESSION="walkthrough"
DIR="/Users/chetbackiewicz/Desktop/demos/walkthrough"
WINDOWS=("intro" "cli_tour" "skills" "aw" "delegate")

# Kill existing session if present
tmux kill-session -t "$SESSION" 2>/dev/null || true

# Create session with first window
tmux new-session -d -s "$SESSION" -n "${WINDOWS[0]}" -c "$DIR"
tmux send-keys -t "$SESSION:${WINDOWS[0]}" "nvim ${WINDOWS[0]}" Enter
tmux split-window -h -t "$SESSION:${WINDOWS[0]}" -c "$DIR"
tmux send-keys -t "$SESSION:${WINDOWS[0]}.2" "copilot" Enter
tmux select-pane -t "$SESSION:${WINDOWS[0]}.1"

# Create remaining windows
for win in "${WINDOWS[@]:1}"; do
  tmux new-window -t "$SESSION" -n "$win" -c "$DIR"
  tmux send-keys -t "$SESSION:$win" "nvim $win" Enter
  tmux split-window -h -t "$SESSION:$win" -c "$DIR"
  tmux send-keys -t "$SESSION:$win.2" "copilot" Enter
  tmux select-pane -t "$SESSION:$win.1"
done

# Select first window and attach
tmux select-window -t "$SESSION:${WINDOWS[0]}"
tmux attach-session -t "$SESSION"
