#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias e='exit'
alias c='clear'
alias b='bluetui'
alias n='nmtui'
#alias y='yazi'
alias ls='lsd'
alias v='source .venv/bin/activate'
alias pa='feh ~/Pictures/screenshots/prac3.png -F'
alias porn='mpv ~/Videos/pp/gifs --fs'
alias fm='fd . ~/Videos --type f | fzf --multi | xargs -d "\n" setsid -f mpv --fs'
alias fb='fd . ~/books --type f --extension pdf | fzf --multi | xargs -d "\n" setsid -f zathura'
alias fe='fd . ~/books --type f --extension pdf | fzf --multi | xargs -d "\n" setsid -f evince'
alias yt='echo yt-dlp -x --audio-format mp3'

#eval "$(zoxide init bash)"
eval "$(starship init bash)"
PS1='[\u@\h \W]\$ '

if ! command -v zoxide >/dev/null; then
    return
fi

# Initialize Zoxide, but handle PROMPT_COMMAND as an array
eval "$(zoxide init bash)"

# Ensure PROMPT_COMMAND is an array and includes __zoxide_hook
if [[ ! ${PROMPT_COMMAND[@]} =~ __zoxide_hook ]]; then
    PROMPT_COMMAND=("__zoxide_hook" "${PROMPT_COMMAND[@]}")
fi

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
