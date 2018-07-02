!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install antibody
if which brew >/dev/null 2>&1; then
  brew install getantibody/tap/antibody || brew upgrade antibody
else
  curl -sL https://git.io/antibody | sh -s
fi
antibody bundle < $HOME/dotfiles"/antibody/bundles.txt" > $HOME/dotfiles/zsh_plugins.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh_plugins.sh $HOME/.zsh_plugins.sh


# Set macOS preferences

# Update antibody after creating symlink
antibody update
# We will run this last because this will reload the shell
source .macos
