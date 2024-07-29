export PATH="/Users/$USER/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/$USER/go/bin:$PATH"
export PATH="/Users/$USER/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# MVN installation version
export M2_HOME="/Users/$USER/.local/share/mvn/apache-maven-3.8.5"
export PATH="${M2_HOME}/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
