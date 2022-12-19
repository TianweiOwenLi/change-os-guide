# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

export WINEPREIFX=~/.wine64


alias bashrc="vim ~/.bashrc"

alias cppc="g++ -std=c++2a -o"

alias cppr="valgrind --tool=memcheck --leak-check=yes"

alias standby="xset dpms force standby"

function study(){
    cd ~/
    cd "$(find ~/Documents/cmu_study/ -name $1)"
}

alias vseeface="export WINEPREFIX=~/.wine64; wine64 ~/Apps/VSeeFace/VSeeFace.exe"
alias obs="cd ~/.wine64/drive_c/Program\ Files/obs-studio/bin/64bit/; wine64 obs64.exe"
alias vroid="cd ~/.wine64/drive_c/users/owenli/Local\ Settings/Application\ Data/Programs/VRoidStudio/1.2.0; wine64 VRoidStudio.exe"
alias oseeface="cd ~/Apps/OpenSeeFace; source env/bin/activate; ./osf.sh"

function mkpic(){
    in=$(basename $1 .pdf)
    mkdir $in/
    cp $in.pdf $in/$in.pdf
    cd $in/
    pdftoppm $in.pdf $in -png
}

function mktex(){
    in=$(basename $1 .tex)
    pdflatex $in.tex
    zathura $in.pdf
}

function unzipd(){
    in=$(basename $1 .zip)
    if [ ! -d "$in" ]; then
        mkdir $in
        unzip $1 -d $in
    else
        echo "error: directory $in already exists"
    fi
}

alias vimtex="vim *.tex"

alias cmunix="ssh tianwei2@unix.andrew.cmu.edu"
alias shark="ssh tianwei2@makoshark.ics.cs.cmu.edu"
# alias ec2="ssh -i ~/Documents/security/aws_keys/aws_key_01.pem ubuntu@3.141.68.198"

function upload_ec2 {
    sudo scp -r -i ~/Documents/security/aws_keys/ed2.pem $1 ubuntu@ec2-3-141-68-198.us-east-2.compute.amazonaws.com:~/upload-temp
}

# neofetch --color_blocks off --battery_display barinfo

# RED='\033[0;31m'
# GREEN='\033[0;32m'
# RED='\033[0;31m'
# NC='\033[0m'

# echo "$(cat ~/startpic.txt)"
# echo -e "\n\n"
# echo -e "  ${GREEN} time: ${NC}$(date)"
# echo -e "  ${GREEN} node: ${NC}$(id -un)@$(uname -n)"
# echo -e "  ${GREEN} os:   ${NC}$(uname -o)"
# echo -e "\n\n"

function ps(){
    str='/'$1'/,/eop/p'
    sed -n $str ~/Documents/security/ps.txt
}

alias flushdns="systemd-resolve --flush-caches"

fullscreen=true
function toggle_tablet {
    if [ ! $fullscreen ]
    then
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Area 0 0 15200 9500
        echo "toggled to full screen"
        fullscreen=true
    else
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Area -15200 -1200 15200 16000
        echo "toggled to right screen"
        fullscreen=
    fi
}

turned=
function tablet_rotate {
    if [ ! $turned ]
    then
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Rotate cw
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Area 3750 -9500 15200 9500
        echo "rotated into scratchpad mode"
        turned=true
    else
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Area 0 0 15200 9500
        echo "rotated back"
        xsetwacom --set "Wacom One by Wacom S Pen stylus" Rotate none
        turned=
    fi
}

alias say="spd-say -t female3 -p 0 -R 0"

PATH="$PATH:$HOME/workspaces/android-studio/bin"
PATH="$PATH:$HOME/apps/appimg"

alias studio="studio.sh"

# sml
alias smlnj="rlwrap sml"

# tex
MANPATH="$MANPATH:/usr/local/texlive/2022/texmf-dist/doc/man"
INFOPATH="$INFOPATH:/usr/local/texlive/2022/texmf-dist/doc/info"
PATH="$PATH:/usr/local/texlive/2022/bin/x86_64-linux"

# alarm. repeat only works with zsh.
function alarm(){
    sudo rtcwake -m mem --date $1
    repeat 30 {paplay /usr/share/sounds/ubuntu/ringtones/Alarm\ clock.ogg} &
}

# fan control, probably only works for thinkpad
function fanspeed(){
    if [ "$1" = "8" ]; then 
        echo level disengaged | sudo tee /proc/acpi/ibm/fan
    else
        echo level $1 | sudo tee /proc/acpi/ibm/fan
    fi
}

# bat info
alias batinfo="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# zsh exclusives
#

autoload -U colors && colors
# PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%F{039}%~%{$reset_color%}$ "
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%F{039}%(5~|%-1~/…/%3~|%4~)%{$reset_color%}$ "
alias zshrc="vim ~/.zshrc"
source /etc/zsh_command_not_found
unsetopt autocd


# cuda
export PATH="$PATH:/usr/local/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/owenli/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/owenli/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/owenli/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/owenli/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

