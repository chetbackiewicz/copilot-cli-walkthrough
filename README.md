# Copilot CLI Walkthrough

A guided presentation walkthrough for demoing GitHub Copilot CLI features. The `start.sh` script launches a tmux session with side-by-side neovim notes and a live `copilot` CLI instance for each topic.
The live copilot CLI instance should start at the root directory of a project matching our `octocat_supply-*` pattern. If none match, it will fall back to the root of the walkthrough directory.

Before starting, clone a demo repository (`octocat_supply-*`) **inside this directory** so that it is a direct child of the walkthrough root (i.e., a sibling of `start.sh`). The `start.sh` script uses `find . -maxdepth 1` to locate it, so the expected layout is:

```
copilot-cli-walkthrough/
├── start.sh
├── octocat_supply-<variant>/   ← clone here
├── intro.md
└── ...
```

## Prerequisites

| Tool | Required | Notes |
|------|----------|-------|
| [tmux](https://github.com/tmux/tmux) | ✅ | Session/window management for the walkthrough |
| [Neovim](https://neovim.io/) | ✅ | Displays talking-point notes in each pane |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli) | ✅ | `brew install copilot-cli` — the star of the show |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | ✅ | Renders styled Markdown in-buffer (included with LazyVim) |
| [Ghostty](https://ghostty.org/) | ⭐ Recommended | Best terminal experience, but any terminal works |

## Quick Start

```bash
./start.sh
```

This creates a tmux session called **walkthrough** with five windows — each splits into notes (left) and a live Copilot CLI (right). Navigate windows with `tmux` keybinds (e.g., `Ctrl-b n` / `Ctrl-b p`).

Walkthrough notes are Markdown files (`.md`) styled by `render-markdown.nvim`. A project-local `.nvim.lua` automatically hides line numbers, sign column, and cursor line for a clean presentation look.

## Presentation Outline

### 1 — Intro (`intro.md`)

- GitHub Copilot CLI meets you where you are — in the terminal
- Installation: `brew install copilot-cli`
- Authentication & setup
- Two experiences (interactive / inline)
- Local configuration lives at `~/.copilot`

### 2 — CLI Tour (`cli_tour.md`)

- Getting help: `?`
- Switching modes: `Tab` / `Shift+Tab`
- Browsing available models: `/models`
- Sub-agents overview: `/agents`
- Fleet of background agents: `/fleet`
- Monitoring running work: `/tasks`

### 3 — Helpful Commands (`helpful_cmds.md`)

- `/diff` — see what changed
- `/review` — review changes
- `/research` — deep dive a topic
- `/context` — check context window usage
- `/compact` — free up context
- `/pr` — PR from here
- `! <command>` — run a shell command directly

### 4 — Skills (`skills.md`)

- **What** — A Markdown file that gives Copilot domain-specific context
- **Where** — `.github/SKILLS` directory in your repo
- **Why** — Passive context that enriches every interaction
- **How** — Create the Markdown file and invoke the skill

### 5 — Delegate (`delegate.md`)

- **Background Agents** — kick off work with `/fleet`
- **Cloud Agents** — hand off tasks with `/delegate`
