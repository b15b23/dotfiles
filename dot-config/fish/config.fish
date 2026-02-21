/opt/homebrew/bin/brew shellenv fish | source

# PATH
fish_add_path "$HOME/.dotfiles/bin"
fish_add_path "$HOME/.local/bin"

# Neovim
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# Enable history in erlang/elixir shell
set -gx ERL_AFLAGS "-kernel shell_history enabled"
# Build erlang/OTP with EEP48 documentation chunks
set -gx KERL_BUILD_DOCS "yes"

# Some tools like lazygit need this to be explicitly set so they don't use the Application Support directory
set -gx XDG_CONFIG_HOME "$HOME/.config"

# PostgreSQL 16+ requires ICU as a dependency for its built-in Unicode collation support
if not contains /opt/homebrew/opt/icu4c/lib/pkgconfig $PKG_CONFIG_PATH
    set -gx PKG_CONFIG_PATH /opt/homebrew/opt/icu4c/lib/pkgconfig $PKG_CONFIG_PATH
end

set -gx CFLAGS "-I/opt/homebrew/opt/openssl/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/openssl/lib"

# Abbreviations

abbr -a bad "bunx --bun astro dev"

abbr -a be "bundle exec"
abbr -a bi "bundle install"
abbr -a br "bundle exec rspec"

abbr -a brc "brew cleanup"
abbr -a bro "brew outdated"
abbr -a bru "brew upgrade"

abbr -a ll "eza -l -g --icons=auto"
abbr -a lla "eza -l -g --icons=auto -a"
abbr -a tree "eza -l -g --icons=auto --tree"

abbr -a g "git"
abbr -a ga "git add"
abbr -a gb "git branch"
abbr -a gc "git commit"
abbr -a gcm "git commit -m"
abbr -a gco "git checkout"
abbr -a gd "git diff"
abbr -a gdc "git diff --cached"
abbr -a gl "git log"
abbr -a gra "git rebase -i --autosquash"
abbr -a gs "git status --short"
abbr -a lg "lazygit --use-config-file="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/themes/catppuccin/macchiato.yml""

abbr -a myip "dig +short myip.opendns.com @resolver1.opendns.com"

# Functions

# Customise fish greeting shown on new windows/tabs
function fish_greeting
    echo -e "\x1b[2mAccessing mainframe…\x1b[0m"
    echo -e "\x1b[1mConsole:\x1b[0m Login successful. Welcome, User."
end

# Generate .gitignore for a specific language
# https://docs.gitignore.io/use/command-line
function gi
    curl -sL https://www.toptal.com/developers/gitignore/api/$argv
end

# Bindings

bind alt-up history-prefix-search-backward

# Integrations

# fzf
# https://github.com/junegunn/fzf
fzf --fish | source

# zoxide
# https://github.com/ajeetdsouza/zoxide
zoxide init fish --cmd cd | source

# mise
# https://mise.jdx.dev
mise activate fish | source

# direnv
# https://github.com/direnv/direnv
direnv hook fish | source

# Starship prompt
# https://starship.rs
starship init fish | source
