# ------- oh-my-zsh specs. Please keep before everything else. -------

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Paths and aliases.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
alias zshconfig="vim ~/.zshrc"

# if set to "random", run "echo $RANDOM_THEME" to know which one was loaded.
# See `github.com/ohmyzsh/ohmyzsh/wiki/Themes`
ZSH_THEME="robbyrussell"

# Setting this variable when ZSH_THEME=random will cause zsh to load a theme 
# from this variable instead of from $ZSH/themes/; Has no effect if empty.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# case-sensitive and hyphen(-/_)-insensitive autocompletion; mutually exclusive.
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled  # Auto-update mode: disabled | auto | reminder
# zstyle ':omz:update' frequency 13   # Auto-update frequency (days)

DISABLE_LS_COLORS="false"           # Disables (true) / Enables (false) colors in `ls`
ENABLE_CORRECTION="false"           # Enables (true) / Disables (false) command auto-correction
DISABLE_AUTO_TITLE="true"           # Disables (true) / Enables (false) auto-setting terminal title

# Uncomment the following if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Disable (true) / Enable (false) marking untracked files under VCS as dirty. 
# Significantly speeds up large repository status check.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# History time stamp format, either "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format ('man strftime' for details)
HIST_STAMPS="yyyy-mm-dd"

# Standard: $ZSH/plugins/; Custom: $ZSH_CUSTOM/plugins/.
# Warning: too many plugins slow down shell startup.
plugins=(git colored-man-pages command-not-found)

# Loads various oh-my-zsh related settings. 
source $ZSH/oh-my-zsh.sh


# --- Other export specs ---

# Please modify as needed.
export MANPATH="/usr/local/man:$MANPATH" # manual path
export LANG=en_US.UTF-8                  # language config
export EDITOR='vim'                      # default editors
export ARCHFLAGS="-arch x86_64"          # compilation flags


# --- Terminal displays ---

# comment the following line to diable terminal startup info
neofetch --color_blocks off --battery_display barinfo

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# --- Connections and Networks ---

alias cmunix="ssh tianwei2@unix.andrew.cmu.edu"
alias shark="ssh tianwei2@makoshark.ics.cs.cmu.edu"

alias flushdns="systemd-resolve --flush-caches"


# --- Android Studio ---

PATH="$PATH:$HOME/workspaces/android-studio/bin"
PATH="$PATH:$HOME/apps/appimg"
alias studio="studio.sh"


# --- rlwraps ---

alias smlnj="rlwrap sml"


# --- LaTeX ---

export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"
export PATH="$PATH:/usr/local/texlive/2023/bin/x86_64-linux"


# --- Security ---

# Recursively changes permission of all files of a given extension.
# The `+` in the end is to reduce total function calls.
function chmod_extension(){
	find . -name $1 -exec chmod $2 {} + 
}


#  --- Cuda ---

export PATH="$PATH:/usr/local/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"


# --- Conda ---

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

