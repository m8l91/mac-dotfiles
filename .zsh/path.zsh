export PATH="/Users/mark/.local/bin:$PATH"
export PATH="/Users/mark/go/bin:$PATH"
export PATH="/Users/mark/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# MVN installation version
export M2_HOME="/Users/mark/.local/share/mvn/apache-maven-3.8.5"
export PATH="${M2_HOME}/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
