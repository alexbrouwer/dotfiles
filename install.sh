#!/usr/bin/env bash

# =======================================
# Bash setup
# =======================================
set -euo pipefail
IFS=$'\n\t'

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# =======================================
# Update repo
# =======================================
echo "Updating dotfiles"
cd $PROJECT_DIR
git pull

# =======================================
# Install
# =======================================
echo "Installing dotfiles"

LN_FILES=(
  ".gitignore_global"
  ".theme"
  ".tmux.conf"
  ".vimrc"
  ".zshrc"
)

for LN_FILE in "${LN_FILES[@]}"
do
  LN_TARGET="$HOME/$LN_FILE"
  LN_SOURCE="$PROJECT_DIR/$LN_FILE"

  if [[ ! -e "$LN_TARGET" ]]; then
    ln -s "$LN_SOURCE" "$LN_TARGET"
    echo "- Installed $LN_FILE"
  fi
done

# =======================================
# Setup
# =======================================
echo "Setup dotfiles"

if [[ ! -z "$(which git)" ]] && [[ -z "$(git config --global -l | grep core.excludesfile)" ]]; then
  git config --global core.excludesfile "$HOME/.gitignore_global"
  echo "- Setup git global ignores"
fi

if [[ ! -f "$HOME/.zsh_settings" ]]; then
  echo "# CUSTOM SETTINGS" >> "$HOME/.zsh_settings"
  echo "- Setup .zsh_settings"
fi