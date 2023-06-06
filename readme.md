# Introduction
This document is intended to describe the process, potential difficulties, and solutions when migrating to a new operating system, in this case **Ubuntu 22.04.1** specifically. This document is still under construction, and only works as a source of suggestion.

# What this document is not
This document is NOT about how to install an OS image on an SSD, as it assumes that you have already successfully installed the OS but yet to configure it. 

This document is NOT a linux command tutorial. If you are confused about some command `xxx`, simply type `xxx -h` or `man xxx` (whichever works) to see its manual. 


# File Management
Duplicate everything in home directory, store them in an external drive (using `rsync` would be good), and when successfully boot, copy things over as needed.
Remember to change the ownership / permission via `chown` or `chmod` if needed.

# App Management
Make a comprehensive list of softwares that you regularly use, be it **Zoom**, **Slack**, **Discord**, **Telegram**, **Mathematica**, **Krita**, **Blender**, **Minecraft**, etc. When the new OS is installed, you can install these softwares all at once or on-demand. Most should be straightforward, for more info please see my `Softwares` section.

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
2. Setup: simply type `zsh`  
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

## OEM kernel (available to specific devices)
Run something like `sudo apt install linux-oem-22.04a` and reboot.

## Boot order
Accessible via command `efibootmgr -v`; alternatively, press and hold `F1` on startup, and modify boot order when BIOS interface appears. 

## Manually update firmware
(TODO)

## Display boot options on startup
1. Open `/etc/default/grub` 
2. Change both `GRUB_TIMEOUT` and `GRUB_HIDE_TIMEOUT` to a higher number of seconds (something like 10 works fine)
3. Run `sudo update-grub` to update grub settings.
4. The boot options will display when device is powered on.

# Media
`vlc` can be installed using `apt`, and provides some media-related support.

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
Note that some path exports are in '.zshrc'.

### Compiler / environments can readily be installed via `apt`: 
C++ (`g++`), Standard ML (`smlnj`), Prolog (`gprolog`)


### LaTeX
[Installation Guide](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#installation)

### Markdown
Should be easily editable using **vscode**. An alternative way to view markdown is to `sudo apt install grip`, then `grip -b filename.md` to view it in browser.

### Docker
[Installation Guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)  
After installation, one may optionally run `sudo usermod -aG docker $USER`, so that future docker commands do not require `sudo`.


### Other things you may wish to install
You may wish to install **miniconda** to manage **Python** environments, as well as the environment of other languages / frameworks that you regularly use. Most of these are relatively straightforward to install with a search on internet. 


# Softwares

### Comes with OS
* __Firefox__ (login syncs bookmarks, history, etc.)

### Installations
In general, softwares can be installed either from official websites, or via package managers like `apt` or `snap`. The syntax are as follows: 
* For `apt,`, run `sudo apt install [package]` to install application.
* For `snap`, run `sudo snap install [package]` or if this does not work, try `sudo snap install [package] --classic`, both of which installs application. 
* For downloaded `.deb` files, run `sudo dpkg -i xxx.deb` or `sudo gdebi xxx.deb` to install application. 
* For downloaded `.AppImage` files, first run `chmod u+x xxx.AppImage` to make it executable, then run `./xxx.AppImage` to run application. 

### Notes about **VsCode**:
Logging into **VsCode** personal account syncs its settings, which can be neat when installing a new OS. 

From the author's personal observation, the **VsCode** from **snap** packages seem to have incomplete functionalities; installing via the [official website](https://code.visualstudio.com/Download) seems to be the best option.


# Power Management
1. Install `tlp` and `powertop` via `apt`. 
2. If not started, run `sudo tlp start`.
3. Modify `tlp` config files at `/etc/tlp.conf`.
4. Run `sudo powertop` to view power saving info.
5. `tlp-stat` can also provide insight on hardware settings and power usage potentials.

# Nvidia GPU
Nvidia graphics card drivers [are generally hard to work with](https://www.youtube.com/watch?v=_36yNWw_07g&ab_channel=Kuttofos). Installing the wrong driver, for example, may make you unable to boot, and thus unable to install the correct driver back. To prevent such an issue, I suggest looking into the section "If you failed to reboot". 

## Installation
For Ubuntu 22.04 specifically, I find that installing using GUI method is appropriate; just go to `Software & Updates` > `Additional Drivers` and select `nvidia-driver-470` (which I found relatively reliable as of Jun 2023), click `Apply Changes`, and reboot. 

## Query
In terminal, type `nvidia-smi` to see current GPU status. 

## Toggle modes
Nvidia GPU has three modes: always use dGPU, use dGPU on demand, and use only iGPU. The current mode can be obtained via `prime-select query`, and can be set via `sudo prime-select [mode]` followed by a reboot.

## If you failed to reboot
If you restarted the computing device right after a fresh Nvidia driver installation / update, and it failed to boot, you probably need some ways to remove these installations. Follow these steps to enter Bash as user `root`: 

([source1](https://askubuntu.com/questions/1437323/ubuntu-no-longer-boots-after-reinstalling-graphics-driver) [source2](https://askubuntu.com/questions/381613/how-to-return-from-grub-prompt-to-the-grub-menu))

1. Power off and power on again
2. Press and hold `Esc` (if boot using UEFI) or `Shift` (if boot using BIOS) for a few seconds, until either a shell with `grub>` or a menu appears.  
   i. If the `grub>` shell appears, type `normal`, press `Enter`, and go to step ii.  
   ii. If a menu appears, keep pressing `Esc` until some "Advanced xxx" option appears.
3. Under the "Advanced" option, select recovery mode for the latest possible kernel. 
4. Another menu shall appear. Select `fsck`, `enable networking`, and then `drop to root prompt`. 

Now you are in Bash, and mistyping commands may jeopardize your OS, so be careful; run the following to remove all **Nvidia** packages: 
```
sudo apt purge $(dpkg -l | grep ^ii.*nvidia | awk '{print $2}')
```
(`dpkg -l` lists packages; `grep ^ii.*nvidia` grabs lines that contain **Nvidia** packages, for more info please search "grep regex cheat sheet"; `awk '{print $2}'` fetches the first term, i.e. package name, from these lines. )

After the above command finishes executing, run `sudo reboot`, and your computing device shall ideally be able to boot. 

