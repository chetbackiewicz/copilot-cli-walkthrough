# Copilot CLI Walkthrough

A guided presentation walkthrough for demoing GitHub Copilot CLI features. The `start.sh` script launches a tmux session with side-by-side neovim notes and a live `copilot` CLI instance for each topic.
The live copilot CLI instance should start at the root directory of a project matching our octodemo_supply-*pattern. If none match, it will fall back to the root of the walkthrough directory.
Before starting, clone a demo repository (octodemo_supply-*) within this directory.

## Prerequisites

| Tool | Required | Notes |
|------|----------|-------|
| [tmux](https://github.com/tmux/tmux) | ✅ | Session/window management for the walkthrough |
| [Neovim](https://neovim.io/) | ✅ | Displays talking-point notes in each pane |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli) | ✅ | `brew install copilot-cli` — the star of the show |
| [Ghostty](https://ghostty.org/) | ⭐ Recommended | Best terminal experience, but any terminal works |

## Quick Start

```bash
./start.sh
```

This creates a tmux session called **walkthrough** with five windows — each splits into notes (left) and a live Copilot CLI (right). Navigate windows with `tmux` keybinds (e.g., `Ctrl-b n` / `Ctrl-b p`).

## Presentation Outline

### 1 — Intro

- GitHub Copilot CLI meets you where you are — in the terminal
- Installation: `brew install copilot-cli`
- Authentication & setup
- Two experiences (interactive / inline)
- Local configuration lives at `~/.copilot`

### 2 — CLI Tour

- Getting help: `?`
- Switching modes: `Tab` / `Shift+Tab`
- Browsing available models: `/models`
- Sub-agents overview: `/agents`
- Fleet of background agents: `/fleet`
- Monitoring running work: `/tasks`

### 3 — Helpful Commands

- `/diff` — see what changed
- `/review` — review changes
- `/research` — deep dive a topic
- `/context` — check context window usage
- `/compact` — free up context
- `/pr` — PR from here
- `! <command>` — run a shell command directly

### 4 — Skills

- **What** — A Markdown file that gives Copilot domain-specific context
- **Where** — `.github/SKILLS` directory in your repo
- **Why** — Passive context that enriches every interaction
- **How** — Create the Markdown file and invoke the skill

### 5 — Delegate

- **Background Agents** — kick off work with `/fleet`
- **Cloud Agents** — hand off tasks with `/delegate`
