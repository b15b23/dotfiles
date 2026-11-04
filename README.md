# .dotfiles

macOS development environment managed with [GNU Stow](https://www.gnu.org/software/stow/manual/).

## What's in here

| Path | What it configures |
|------|--------------------|
| `dot-config/fish/` | Fish shell — env vars, abbreviations, integrations (fzf, zoxide, mise, direnv, starship) |
| `dot-config/nvim/` | Neovim — LSP, completion (blink.cmp), treesitter, snacks.nvim, formatting |
| `dot-config/ghostty/` | Ghostty terminal |
| `dot-config/starship.toml` | Starship prompt |
| `dot-config/bat/` | bat syntax highlighting |
| `dot-config/lazygit/` | Lazygit |
| `dot-gitconfig` | Git — signing, diff tools, global ignores |
| `dot-irbrc` | Ruby IRB |
| `dot-default-npm-packages` | Global npm packages (language servers) |
| `bin/` | Scripts (colorscript + terminal color art) |
| `Brewfile` | Homebrew packages and casks |

Catppuccin Macchiato theme throughout.

## Setup

Clone into home directory:

```sh
git clone https://github.com/sineraves/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Install Homebrew (if needed):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages and symlink configs:

```sh
brew bundle
stow --dotfiles .
```

The `--dotfiles` flag tells stow to treat `dot-` prefixed names as `.` — so `dot-gitconfig` becomes `~/.gitconfig`, `dot-config/` becomes `~/.config/`, etc.

Stow won't clobber existing files — if a real file (not a symlink) already exists at the target path, stow will abort with a conflict. Remove or back up the conflicting file first, then re-run.

If `stow` isn't found (first run before Homebrew is on PATH):

```sh
/opt/homebrew/bin/stow --dotfiles .
```

## Credits

`bin/colorscript` is a Fish port of [shell-color-scripts](https://github.com/charitarthchugh/shell-color-scripts) by charitarthchugh, itself based on the [original](https://gitlab.com/dwt1/shell-color-scripts) by Derek Taylor (DistroTube).
