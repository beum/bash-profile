
# Colors for ANSI prompts

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

# Code for PS1
# Based on: http://stackoverflow.com/a/13003854/170413

find_git_branch() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=''
  fi
}

txtred='\e[0;31m' # Red
txtcyn='\e[0;36m' # Cyan
txtrst='\e[0m'    # Text Reset

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
export PS1="\u@\h \W \[$Cyan\]\$git_branch\[$BIRed\]\$git_dirty\[$Color_Off\]\$ "

# Alias for normal bash commands
alias ll='ls -lha'
alias sbp='source ~/.bash_profile'


# Aliases for git basic commands

alias g='git'

alias gs='git status'
alias gl='git log --stat --graph'

alias gb='git branch'
alias gbd='git branch --D'

alias gco='git checkout'
alias gcb='git checkout -b'

# Commit oriented commands
alias gd='git diff'
alias ga='git add'
alias gaa='git add . --all'
alias grm='git rm'

alias grs='git reset HEAD'
alias grsh='git reset --hard'

alias gc='git commit'
alias gcm='git commit -m'

# Merge commands
alias gm='git merge'
alias gmf='git merge --no-ff'

# Rebasing commands
alias gr='git rebase'
alias grd='git rebase dev'
alias gri='rebase(){ git rebase -i HEAD~$1; }; rebase' # Interactive rebase

# Stash commands
alias gsl='git stash list'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsd='git stash drop'

# Remote commands
alias gx='git remote'
alias gxl='git remote list -v'
alias gxa='git remote add'
alias gxr='git remote remove'

# Fetch, pull, push
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'

alias gpl='git pull'
alias gplo='git pull origin'
alias gplu='git pull upstream'

alias gps='git push'
alias gpso='git push origin'
alias gpsu='git push upstream'
