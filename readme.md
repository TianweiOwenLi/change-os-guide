# Introduction
This document is intended to describe the process, potential difficulties, and solutions when migrating to a new operating system, in this case **Ubuntu 22.04.1** specifically. This document is still under construction, and only works as a source of suggestion.

# File Management
Duplicate everything in home directory, store them in an external drive (using `rsync` would be good), and when successfully boot, copy things over as needed.
Remember to change the ownership / permission via `chown` or `chmod` if needed.

# General
First, tune all settings, power, network, sound, shortcuts, defaults, etc.  
Optionally, nstall __Tweaks__ through __Ubuntu Software Center__ for a few more tunable settings.

## Gnome Extensions
Install __Extension Manager__ through __Ubuntu Software Center__. Note that some GNOME extensions will cause a __Wayland__ sessions to freeze, so proceed with caution. When an extension makes a __Wayland__ session unusable, one potential solution is to reboot the device, and login with a different session (something like Xorg might work). 

## Language Support (using Simplified Chinese as an example)
1. Install: `sudo apt install ibus-pinyin`
2. Install languages in settings, *Region/Format*
3. Reboot
4. Go to __Settings > keyboard > Input Sources__, add Chinese and choose "Intelligent Pinyin"
5. Fine-tune input settings

# Commandline
Before you proceed, the following tools may be helpful and are easily installable via `apt`:  
`curl, neofetch, progress, rlwrap, tmux, tree, vim, uname`

## Vim
1. Install vim: `sudo apt install vim`
2. Install [vim plug](https://github.com/junegunn/vim-plug) with the following command:  
`
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
`
3. Copy .vimrc
4. Enter __vim__ and type `:PlugInstall`
5. Copy directory .vim/templates
6. Other modules (TODO)

## Shell
1. Install: `sudo apt install zsh`  
2. Setup: `zsh`  
3. Install __oh-my-zsh__: ```sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```
4. Copy .zshrc  
5. Change shell: `chsh -s $(which zsh)`  
6. To access history, either use command `history` or see `~/.histfile`.

# Network Connection
Follow the GUI will work for the most part. If it does not, there are a few debug tips: 

## WIFI needs to be manually reconnected everytime device unlocks: 
toggle "automatic connect to wifi" under settings.

## WIFI needs certificate:
check directories `/usr/share/ca-certificates` or `/usr/local/ca-certificates`, certificates tend to be there. To manually install a `.crt` certificate file from your institute, first install __ca-certificates__ via `sudo apt install ca-certificates`, then copy the `.crt` file to folder `/usr/local/share`, and run `sudo update-ca-certificates`.

## Cannot connect to WIFI
1. List available wifis using `nmcli d wifi list` and look up its __SSID__ and __SECURITY__. 
2. Open up something like "__Advanced Network Configuration__" (for Ubuntu 22.04) or some other interfaces for manually adding network, then add the desired connection accordingly. For Ubuntu 22.04 specifically (and probably generalizes to other OS that uses *NetworkManager*), such network config files are stored at `/etc/NetworkManager/system-connection/`.

# Operating System

## OEM kernel
1. Install: `sudo apt install linux-oem-22.04a`
2. Reboot

## Boot order
Accessible via command `efibootmgr -v`. 

## Manually update firmware
(TODO)

## Display boot options on startup
1. Open `/etc/default/grub` 
2. Change both `GRUB_TIMEOUT` and `GRUB_HIDE_TIMEOUT` to a higher number of seconds (something like 10 works fine)
3. Run `sudo update-grub` to update grub settings.
4. The boot options will display when device is powered on.

# Media
`eog, grip, vlc` can be installed using `apt`, and provides some media-related support.

# Workspace
The following tools may be helpful and are easily installable via `apt`:  
`git, gh`

For `git` setup, run  
`git config --global user.name "name"`  
`git config --global user.email "example@email.com`

For `gh` setup, run  
`gh auth login`

## Pulling existing repo: 
(TODO) 

# Environments
Note that many path exports are in '.zshrc'.

Also, 

### C++
`sudo apt intall g++`

### Rust
Link is [here](https://www.rust-lang.org/tools/install):  
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

### SML
`sudo apt install smlnj`

### Prolog
`sudo apt install gprolog`

### LaTeX
[Installation Guide](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#installation)

### Markdown
Should be easily editable using **vscode**. An alternative way to view markdown is to `sudo apt install grip`, then `grip -b filename.md` to view it in browser.

### Docker
[Installation Guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)  
After installation, one may optionally run `sudo usermod -aG docker $USER`, so that future docker commands do not require `sudo`.

### Flutter
1. Install: `sudo snap install flutter --classic`
2. Sdk path: `flutter sdk-path`

### Java
TODO

# Softwares

### Comes with OS
* __Firefox__ (login syncs bookmarks, history, etc.)

### Installable via `sudo snap install`: 
* __Blender__: `sudo snap install blender --classic`
* __GIMP__: `sudo snap install gimp`
* __Krita__: `sudo snap install krita`
* __Telegram__: `sudo snap install telegram-desktop`
* __Xournalpp__: `sudo snap install xournalpp`
* __Zoom__: `sudo snap install zoom-client`

### Installable via url:
* [__Android Studio__](https://developer.android.com/studio/install)
* [__Discord__](https://discord.com/download)
* [__Slack__](https://slack.com/downloads/linux)
* [__VSCode__](https://code.visualstudio.com/Download) (login syncs settings)
* __Google Earth__ (TODO)

### Free:
* __Cura__ (TODO)
* __Outline__ (TODO)
* __Miniconda__ (TODO)

### Paid:
* __Mathematica__ (TODO)
* __Matlab__ (TODO)
* __Minecraft__ (TODO)

### Command Line Interfaces:

# Power Management
1. Install needed softwares: `sudo apt install tlp powertop`
2. If not started, run `sudo tlp start`
3. Modify config files via `/etc/tlp.conf`
4. Use powertop to view power saving info
