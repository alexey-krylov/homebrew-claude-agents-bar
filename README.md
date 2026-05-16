# homebrew-claude-agents-bar

Homebrew tap for [ClaudeAgentsBar](https://github.com/alexey-krylov/ClaudeAgentsBar) —
a macOS menu-bar widget that tracks live status of every running
Claude Code session.

## Install

```bash
brew install --cask swiftbar                              # if missing
brew install alexey-krylov/claude-agents-bar/claude-agents-bar
claude-agents-bar setup
```

`brew install` only places the bundle under `$HOMEBREW_PREFIX` and
exposes a `claude-agents-bar` CLI. `setup` is the explicit, user-invoked
step that:

- symlinks the SwiftBar plugin into your SwiftBar plugins directory,
- symlinks the Claude Code hook into `~/.claude/hooks/`,
- merges hook registrations into `~/.claude/settings.json` (backup first).

This separation is intentional — Homebrew formulas should not modify
user dotfiles at install time.

## Upgrade

```bash
brew update
brew upgrade claude-agents-bar
```

`setup` only needs to be re-run if you previously ran `teardown` —
the symlinks the formula laid down survive upgrades.

## Uninstall

```bash
claude-agents-bar teardown          # remove symlinks + clean settings.json
brew uninstall claude-agents-bar    # remove the binary
```

The four sidecar files under `~/.claude/` (`agent-state.tsv`,
`agent-state.clicks`, `agent-state.dismiss`, `agent-state.forget`)
are left in place — delete manually if you want a fully clean slate.

## Verify

```bash
claude-agents-bar doctor
```

Checks `jq`, `python3`, and SwiftBar.app are all reachable.

## Docs

Everything else — configuration, troubleshooting (notch issues),
architecture — lives in the main repo:
<https://github.com/alexey-krylov/ClaudeAgentsBar>.

## License

MIT. Same as the upstream project.
