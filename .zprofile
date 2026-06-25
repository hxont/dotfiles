
eval "$(/opt/homebrew/bin/brew shellenv)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [[ -o interactive && -z "$TMUX" && "$TERM_PROGRAM" == "iTerm.app" ]]; then
  tmux attach -t main 2>/dev/null || tmux new -s main
fi

