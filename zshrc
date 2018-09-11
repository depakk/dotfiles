# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/depak/.zshrc'

# source <(antibody init)
export NVM_LAZY_LOAD=true
source ~/.zsh_plugins.sh

# Carlos' sped up recommendation
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
# End of lines added by compinstall


fpath=(/usr/local/share/zsh-completions $fpath)

# Export bin paths
export PATH='/usr/local/bin:/usr/local:/usr/local/sbin:/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin'
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
# I don't have Java 1.8 so error for next line
# export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias brewup='brew update && brew doctor && brew outdated && brew upgrade && brew cask upgrade && brew cleanup && brew prune'
alias ll='ls -lG'

# alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

#
# Docker init
#eval "$(docker-machine env default)"

# export NVM_DIR="/Users/pasinduperera/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# export ANDROID_HOME="/usr/local/opt/android-sdk"
# export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1/"


# allow the '*' to work in things like du -sh *
unsetopt nomatch

