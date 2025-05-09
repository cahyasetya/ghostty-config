#!/bin/bash
# Ghostty Installation and Setup Script

echo "Ghostty Installation Helper"
echo "=========================="
echo

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install Ghostty
echo "Installing Ghostty..."
brew install --cask ghostty

# Check if installation succeeded
if [ $? -eq 0 ]; then
    echo "Ghostty installed successfully!"
else
    echo "There was an error installing Ghostty. Please check Homebrew output."
    exit 1
fi

# Create proper config file
echo "Setting up configuration file..."
cat > ~/.config/ghostty/config << EOF
# Ghostty Configuration - Simple Beautiful Blurry Theme

# Font configuration
font-family = "JetBrains Mono"
font-size = 16
font-feature = "calt"
font-feature = "liga"  # Enable ligatures for code
font-feature = "ss01"  # Enhanced alternates

# Window appearance - beautiful blur
background-opacity = 0.85
background-blur = 15
window-theme = "dark"
window-padding-x = 25
window-padding-y = 25

# Tokyo Night Dark theme colors
foreground = "#c0caf5"
background = "#1a1b26"
selection-foreground = "#1a1b26"
selection-background = "#c0caf5"
window-frame = "#7aa2f7"

# Terminal colors - Tokyo Night palette
palette = 0="#1a1b26"
palette = 1="#f7768e"
palette = 2="#9ece6a"
palette = 3="#e0af68"
palette = 4="#7aa2f7"
palette = 5="#bb9af7"
palette = 6="#7dcfff"
palette = 7="#a9b1d6"
palette = 8="#414868"
palette = 9="#f7768e"
palette = 10="#9ece6a"
palette = 11="#e0af68"
palette = 12="#7aa2f7"
palette = 13="#bb9af7"
palette = 14="#7dcfff"
palette = 15="#c0caf5"

# Cursor design
cursor-color = "#bb9af7"
cursor-style = "block-blinking"
cursor-blink-interval = 750

# User experience improvements
mouse-hide-while-typing = true
scrollback = 10000
copy-on-select = true
clipboard-trim-trailing-spaces = true

# Shell integration
shell-integration = "detect"
shell-integration-features = "cursor,title,prompt"

# Basic keybindings
keybind = "ctrl+shift+c"="copy_to_clipboard"
keybind = "ctrl+shift+v"="paste_from_clipboard"
keybind = "cmd+shift+,"="reload_config"
EOF

echo
echo "Installation complete! Here's how to get started:"
echo "1. Open Ghostty from your Applications folder"
echo "2. Do NOT try to execute the config file directly"
echo "3. Ghostty will automatically read your configuration"
echo
echo "Enjoy your beautiful terminal!"
