# Copilot CLI Walkthrough

A guided presentation walkthrough for demoing GitHub Copilot CLI features. The `start.sh` script launches a tmux session with side-by-side neovim notes and a live `copilot` CLI instance for each topic.

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

### 3 — Skills

- **What** — A Markdown file that gives Copilot domain-specific context
- **Where** — `.github/SKILLS` directory in your repo
- **Why** — Passive context that enriches every interaction
- **How** — Create the Markdown file and invoke the skill

### 4 — Agentic Workflows

- **What** — Workflow File + AW compiler
- **Where** — `.github/workflows`
- **Why** — Security-first CI + AI
- **How** — Write a workflow → compile to a lock file → set permissions on repo → trigger like a regular workflow

### 5 — Delegate

- **Background Agents** — kick off work with `/fleet`
- **Cloud Agents** — hand off tasks with `/delegate`
