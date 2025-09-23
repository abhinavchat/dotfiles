. "$HOME/.cargo/env"
. "$HOME/.atuin/bin/env"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Java path
    # export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
    # export JAVA_HOME="/opt/homebrew/opt/openjdk@17"

    # Sourcing sdkman for Java
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

    # ✅ FORCE SDKMAN JAVA FIRST in PATH
    export PATH="$JAVA_HOME/bin:$PATH"
fi
