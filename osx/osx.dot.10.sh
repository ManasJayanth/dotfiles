if [[ "$(uname -a)" != *Darwin* ]]; then return; fi

# Use GNU coreutils - it's easier if programs have the same flags between
# machines, same man pages etc.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Bash completion lives in the brew directory
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias emacs-app="/Applications/Emacs.app/Contents/MacOS/Emacs"

function ,finder-pull() {
    # cd to topmost Finder window directory
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# This is easier than messing with system pythons and pips etc.
# The prompt is set /after/ this, so won't see a (venv) prefix. 
if [ -d ~/venv ]; then
    source ~/venv/bin/activate
fi