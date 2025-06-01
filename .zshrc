# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# 플러그인
plugins=(
    git
    autojump
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# theme.sh 관련 설정 (필요한 경우에만 사용)
# if command -v theme.sh > /dev/null; then
#   [ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
# fi
#theme.sh gruvbox-material-dark-soft
theme.sh nord
# POWERLEVEL9K_INSTANT_PROMPT 설정 (Powerlevel9k 사용시에만 필요)
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vi=nvim
alias 퍄=nvim
alias man=tldr
alias ls=lsd
alias ㅣㄴ=ls
alias 칟ㅁㄱ=clear

export NVIM_APPNAME=nvim

# ... other configurations ...

# PATH 설정 (한 번만 설정해야 함)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" # 기본적인 시스템 경로
export PATH="$HOME/.local/bin:$PATH"          # ~/.local/bin 경로
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH" # mason.nvim 경로
export VIMRUNTIME=/usr/share/nvim/runtime  # nvim 런타임경로


# NVM 설정 (PATH 설정 후)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ... other configurations ...
# 가상 환경 자동 활성화
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
fi
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

