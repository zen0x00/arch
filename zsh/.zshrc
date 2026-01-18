fastfetch

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#ZSH Plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

#Load Completions
autoload -U compinit && compinit

#History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=50000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ---- Syntax highlighting colors (your theme) ----
ZSH_HIGHLIGHT_STYLES[command]="fg=#81a1c1"        # commands (cd, ls)
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#81a1c1"
ZSH_HIGHLIGHT_STYLES[function]="fg=#81a1c1"

ZSH_HIGHLIGHT_STYLES[path]="fg=#d8dee9"
ZSH_HIGHLIGHT_STYLES[arg]="fg=#d8dee9"

ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=#d8dee9"

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#bf616a,bold"
ZSH_HIGHLIGHT_STYLES[error]="fg=#bf616a,bold"

ZSH_HIGHLIGHT_STYLES[quoted]="fg=#b48ead"
ZSH_HIGHLIGHT_STYLES[string]="fg=#8fbcbb"

ZSH_HIGHLIGHT_STYLES[comment]="fg=#616e88"

# Fix Delete key across all zsh keymaps
for map in emacs viins vicmd; do
  bindkey -M $map '^[[3~' delete-char
done

# Aliases
alias install='yay -S'
alias search='yay -Ss'
alias ls='colorls'
alias vim='nvim'
alias c='clear'
alias clock='tty-clock -C 7 -c'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

export PATH="$PATH:/home/aman/.dotnet/tools"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:~/.spicetify
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
