#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Python is installed
if command_exists python3; then
    echo "Python is already installed."
else
    # Check if Homebrew is installed
    if command_exists brew; then
        echo "Homebrew is installed."
    else
        echo "Homebrew is not installed. Installing Homebrew..."
        # Install Homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    
    # Install Python using Homebrew
    echo "Installing Python using Homebrew..."
    brew install python
    
    # Add Python to PATH in .bashrc
    echo 'export PATH="/usr/local/opt/python/bin:$PATH"' >> ~/.bashrc
    
    # Reload .bashrc
    source ~/.bashrc
    
    echo "Python installed successfully."
fi
