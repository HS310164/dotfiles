# module_path+=( "$HOME/.zplugin/bin/zmodules/Src" )
# zmodload zdharma/zplugin

### Added by Zplugin's installer
if [[ ! -d $HOME/.zplugin/bin ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing Zplugin…%f"
    command mkdir -p $HOME/.zplugin
    command git clone https://github.com/zdharma/zplugin $HOME/.zplugin/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zsh-users/zsh-autosuggestions

zplugin load zdharma/history-search-multi-word
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin
zplugin ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zplugin load docker/compose
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras
zplugin creinstall %HOME/my_completions
zplugin light zsh-users/zsh-completions
zplugin light zdharma/fast-syntax-highlighting
#PROMPT='%F{green}%d%f
#[%n@%m]%# '

export PATH="/usr/local/opt/ruby/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

autoload -U compinit
compinit

alias hgrep='history -E 1 | grep --color=auto'

# Setting of History file
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

setopt correct
setopt NO_BEEP

setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
unsetopt promptcr

zstyle ':completion:*:default' menu select=2
# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
# zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
# zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
# zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
#補完でカラーを使用する
# autoload colors
# colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

alias -g grep='grep --color=auto'
alias -g fgrep='fgrep --color=auto'
alias -g egrep='egrep --color=auto'

alias -g ll='ls -alF'
alias -g la='ls -A'
alias -g l='ls -CF'

# key-binds
bindkey '^r' history-search-multi-word

export CLOUDSDK_PYTHON='/Users/satouhiroshi/.pyenv/versions/2.7.17/envs/gcloud/bin/python'
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/satouhiroshi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/satouhiroshi/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/satouhiroshi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/satouhiroshi/google-cloud-sdk/completion.zsh.inc'; fi

export LDFLAGS="-L/usr/local/opt/libffi/lib"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
