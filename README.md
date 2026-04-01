# Dots

## 📋 Overview

This repository contains my personal configuration files (dotfiles) for Arch Linux. These dotfiles are designed to create a seamless, efficient, and personalized workflow, carefully crafted over time to maximize productivity and aesthetic appeal.

### Featured Configurations

- **Hyprland**: A dynamic tiling Wayland compositor
- **Neovim**: Highly efficient text editor with modern capabilities
- **Alacritty**: Fast GPU-accelerated terminal emulator
- **tmux**: Terminal multiplexer for session management
- **zsh**: Feature-rich shell with extensive customization
- **Waybar**: Highly customizable status bar for Wayland
- **And more**: Various utilities and small configurations

## ⚙️ Installation

### Prerequisites

Ensure you have the following installed on your Arch Linux system:

- **[GNU Stow](https://www.gnu.org/software/stow)**: For managing symlinks
- **Git**: For cloning this repository

```bash
sudo pacman -S stow git
```

### Setting Up Dotfiles

1. **Clone the Repository**

   ```bash
   git clone https://github.com/albugowy15/dots.git ~/dots
   ```

2. **Navigate to the Dotfiles Directory**

   ```bash
   cd ~/dots
   ```

3. **Create Symlinks Using Stow**

   To deploy all configurations:

   ```bash
   stow .
   ```

   Or deploy specific configurations:

   ```bash
   stow nvim
   stow zsh
   stow hyprland
   # etc.
   ```

4. **Apply Configurations**

   Some configurations may require restarting applications or logging out and back in to take effect.

## 🔧 Customization

These dotfiles are designed to be easily customizable to suit your preferences:

1. **Before Making Changes**
   - Create backups of your existing configurations
   - Review the structure of each configuration directory

2. **Making Changes**
   - Modify files directly in the `~/dots` directory
   - Test changes incrementally to ensure stability

3. **After Making Changes**
   - Restart the relevant application or reload its configuration
   - For system-wide changes, consider logging out and back in

## 📝 Notes

- These configurations are primarily tested on Arch Linux
- Some configurations may require additional dependencies
