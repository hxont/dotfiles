# 🎀 babypink.zsh-theme — white prompt + hot pink accents
# oh-my-zsh custom theme

setopt prompt_subst

_BP_WHITE="231"   # 흰색 (프롬프트 배경)
_BP_DEEP="#666666" # 연한 검정 (흰 배경 위 글자)
_BP_PINK="198"    # 핵핑크 (git 세그먼트)
_BP_SEP=$'\ue0b0'    # powerline 화살표 
_BP_BRANCH=$'\ue0a0' # git 브랜치 아이콘 

_bp_git() {
  local ref
  ref=$(command git symbolic-ref --short HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  echo "$ref"
}

_bp_build() {
  local branch
  branch=$(_bp_git)
  # 흰 배경 + 진한 핑크 글자: hxont 🎀 + 경로
  print -n "%K{$_BP_WHITE}%F{$_BP_DEEP} hxont 🎀 %~ "
  if [[ -n "$branch" ]]; then
    # 흰색 → 핵핑크 전환 + git 브랜치(흰 글자)
    print -n "%K{$_BP_PINK}%F{$_BP_WHITE}${_BP_SEP}%F{$_BP_WHITE} ${_BP_BRANCH} ${branch} %k%F{$_BP_PINK}${_BP_SEP}%f "
  else
    print -n "%k%F{$_BP_WHITE}${_BP_SEP}%f "
  fi
}

PROMPT='$(_bp_build)'
RPROMPT=''
