# philoso.zsh-theme

iscommand() { command -v "$1" > /dev/null; }

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_tip_switch {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo '(ﾉ˚Д˚)ﾉ'
    else
        # echo '○'
        # echo '(ಡ ω ಡ)○'
        echo '─➤'
    fi
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

function dev_using_check {
    local dev_prompt_prefix="%{$FG[239]%}using%{$FG[243]%} ‹"
    local dec_prompt_suffix="› %{$reset_color%}"
    local app_version=""

    local dev_python_check() {
        if [[ -d "venv" ]]; then
            venv/bin/python --version
        elif [[ -f "requirements.txt" ]]; then
            python --version
        else
            return 1
        fi
    }

    local dev_nodejs_check() {
        if [[ -d "node_modules" || -f "package.json" ]]; then
            node --version
        else
            return 1
        fi
    }
    
    if app_version=`dev_python_check`; then
    elif app_version=`dev_nodejs_check`; then
    else 
        echo "none"
        return 1
    fi

    echo "${dev_prompt_prefix}${app_version}${dec_prompt_suffix}"
}

local current_dir='${PWD/#$HOME/~}'
local git_info='`git_prompt_info`'
local prompt_pre_char='`prompt_tip_switch`'

PROMPT="
╭─[%{$FG[157]%}$(box_name)%{$reset_color%}] %{$FG[239]%}as%{$reset_color%} %{$reset_color%}%n%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[228]%}${current_dir}%{$reset_color%}${git_info} 	%D %*
╰─$(virtualenv_info)${prompt_pre_char} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} (%{$FG[159]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%})%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%})%{$FG[040]%}✔"
