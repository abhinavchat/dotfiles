# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set Oh My Zsh theme conditionally (Fix for Cursor issues)
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  ZSH_THEME=""  # Disable Powerlevel10k for Cursor
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    plugins=(
        aws
        command-not-found
        docker
        git
        rust
        sudo
        systemd
        vscode
        web-search
        colored-man-pages
        z
        python
        encode64
        macos
        jsontools
        pyenv
    )

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    plugins=(
        aws
        command-not-found
        docker
        git
        rust
        sudo
        systemd
        vscode
        web-search
        zsh-autosuggestions
        zsh-completions
        colored-man-pages
        zsh-syntax-highlighting
        z
        python
        encode64
        macos
        jsontools
        pyenv
    )

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # Locale
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    # Add mysql-client to path
    export PATH="/opt/homebrew/Cellar/mysql-client/8.0.27/bin":$PATH
    export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

    # Set GOBIN path
    export GOBIN="$HOME/go/bin"
    export PATH=$GOBIN:$PATH

    # Set miktex path
    export PATH="$HOME/bin":$PATH

    # Added by LM Studio CLI (lms)
    export PATH="$PATH:$HOME/.lmstudio/bin"

    # XDG_CONFIG_HOME
    export XDG_CONFIG_HOME=/Users/$(whoami)/.config

    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # fzf key bindings
    eval "$(fzf --zsh)"

   # Add brew installed GNU nano path instead of pre-installed pico
   export PATH="/opt/homebrew/bin:$PATH"
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Use a minimal prompt in Cursor to avoid command detection issues
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  PROMPT='%n@%m:%~%# '
  RPROMPT=''
else
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# add Poetry to PATH
export PATH="$HOME/.local/bin":$PATH

# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# load envs from .zshenv
if [ -f ~/.zshenv ]; then
    . ~/.zshenv
fi

# Source secrets function from .secrets_env
if [ -f ~/.secrets_env ]; then
    . ~/.secrets_env
fi

# Source functions from .functions
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Neofetch
#neofetch

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"

# ngrok completions
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# uv and uvx shell autocompletion
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Set GPG-TTY
export GPG_TTY=$(tty)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/abhinavchat/.lmstudio/bin"
# End of LM Studio CLI section
