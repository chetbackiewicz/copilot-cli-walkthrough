#!/usr/bin/env bash
set -euo pipefail

SESSION="walkthrough"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WINDOWS=("intro" "cli_tour" "helpful_cmds" "skills" "delegate")

# Detect the octocat_supply-* project directory
PROJECT_DIR=$(find "$DIR" -maxdepth 1 -type d -name "octocat_supply-*" | head -1)
if [[ -z "$PROJECT_DIR" ]]; then
  echo "⚠️  No octocat_supply-* directory found — copilot will open in walkthrough root"
  PROJECT_DIR="$DIR"
fi

# Kill existing session if present
tmux kill-session -t "$SESSION" 2>/dev/null || true

# Create session with first window (intro: notes left, two empty shells stacked right)
tmux new-session -d -s "$SESSION" -n "${WINDOWS[0]}" -c "$DIR"
tmux send-keys -t "$SESSION:${WINDOWS[0]}" "nvim ${WINDOWS[0]}" Enter
tmux split-window -h -t "$SESSION:${WINDOWS[0]}" -c "$PROJECT_DIR"
tmux split-window -v -t "$SESSION:${WINDOWS[0]}.2" -c "$PROJECT_DIR"
tmux select-pane -t "$SESSION:${WINDOWS[0]}.1"

# Create remaining windows
for win in "${WINDOWS[@]:1}"; do
  tmux new-window -t "$SESSION" -n "$win" -c "$DIR"
  tmux send-keys -t "$SESSION:$win" "nvim $win" Enter
  tmux split-window -h -t "$SESSION:$win" -c "$PROJECT_DIR"
  tmux send-keys -t "$SESSION:$win.2" "copilot" Enter
  tmux select-pane -t "$SESSION:$win.1"
done

# Select first window and attach
tmux select-window -t "$SESSION:${WINDOWS[0]}"
tmux attach-session -t "$SESSION"
