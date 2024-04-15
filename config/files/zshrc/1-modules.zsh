# Add our custom completions directory
fpath=("/home/daniel/.config/dotfiles/zshrc-completion/" $fpath)

# Enable completion support.
autoload -U compinit complete complist computil
compinit -u >/dev/null

# Prompt customization support.
autoload -U promptinit
promptinit

# Enable color support.
autoload -U colors
colors

# Enable regex support.
autoload -U regex
