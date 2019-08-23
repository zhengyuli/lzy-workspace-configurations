# LZY Workspace Configurations

This documentation will guide you to setup an efficient workspace which includes all kinds of daily used tools on mac platform.

## Homebrew

[Homebrew](https://brew.sh/), the missing package manager for macOS and is an essential tool for any developer.

### Installation

Before you can run Homebrew you need to have the _Command Line Tools_ for _Xcode_ installed. It include compilers that will allow you to build things from source, and if you are missing this it's available through the _App Store > Updates_.

To install Homebrew run the following: terminal, hit Enter, and follow the steps on the screen:

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

One thing you need to do is tell the system to use programs installed by Hombrew (in /usr/local/bin) rather than the OS default if it exists. You do this by adding /usr/local/bin to your PATH environment variable (if you're using zsh you should use .zshrc instead of .bash_profile):

```
$ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
```

Alternatively, you can also insert /usr/local/bin to the first line of /private/etc/paths and reboot the Mac to change global paths loading order. Admin password may be required if you modify the file.

To be able to use brew you need to start a new terminal session. After that you should make sure everything is working by running:

```
$ brew doctor && brew update
```

## Iterm2

[iTerm2](https://www.iterm2.com/) is a replacement for Terminal and the successor to iTerm. It brings the terminal into the modern age with features you never knew you always wanted.

### Installation

Use Homebrew to download and install:

```
$ brew cask install iterm2
```

### Customization

#### Theme

Download Solarized theme for iTerm2:

```
$ git clone https://github.com/altercation/solarized
```

Import Solarized dark theme through _iTerm2 > Preferences > Profiles > Colors > Color Presets > Import_ and after that you can select the **Solorized Dark** theme through _iTerm2 > Preferences > Profiles > Colors > Color Presets > Solorized Dark_.

#### Key Bindings

Configure shortcuts through _iTerm2 > Preferences > Keys > Key Mappings_ panel.

| Action       | Key Mapping |
|:-------------|:------------|
| Previous Tab | ⇧⌘P         |
| Next Tab     | ⇧⌘N         |

## Zsh + Oh My Zsh

The Z shell (also known as zsh) is a Unix shell that is built on top of bash (the default shell for macOS) with additional features, while Oh My Zsh is an open source, community-driven framework for managing your zsh configuration. It comes with a bunch of features out of the box and improves your terminal experience.

### Installation

**Install zsh using Homebrew:**

```
$ brew install zsh
```

**Install Oh My Zsh:**

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

**Notice:** the installation script should set zsh to your default shell, but if it doesn't you can do it manually.

```
$ chsh -s $(which zsh)
```

### Customization

The out-of-the-box configuration is usable but you probably want to customise it to suit your needs. The Official [Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki) contains a lot of useful information if you want to deep dive into what you can do with Oh My Zsh, but we'll cover the basics here.

#### Plugins

Standard plugins can be found in ~/.oh-my-zsh/plugins/*, custom plugins may be added to ~/.oh-my-zsh/custom/plugins/. Add plugins to your shell by adding the name of the plugin to the plugin array in your **~/.zshrc**.
Add wisely, as too many plugins slow down shell startup.

**Download custom plugins**

```
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

**Add daily used plguins**

```
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   fzf
   git
   docker
   iterm2
   autojump
   history
   zsh-autosuggestions
   zsh-syntax-highlighting
)

# Key bindings for autosuggestions plugin
bindkey '^],' autosuggest-accept
```

#### Themes

Changing theme is as simple as changing a string in your configuration file. The default theme is robbyrussell. Just change that value to change theme, and don't forget to apply your changes.

```
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sonicradish"
```

#### env.sh

Create a new .env.sh under your home directory with the following.

```
#!/bin/zsh

# Disable homebrew auto update
export HOMEBREW_NO_AUTO_UPDATE="true"
```

To include _.env.sh_, open _~/.zshrc_ and add the following:

```
source ~/.env.sh

```

## Golang

Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.

### Installation

Download the latest version from [https://golang.org/dl/]() and install manually, after installation you should create the directory for _$GOPATH_ which will be used as the golang project workspace.

```
$ mkdir -p $HOME/MyGoProjects
```

### Customization

Append the following to your ~/.env.sh script

```
# Settings for golang
export GOPATH=$HOME/MyGoProjects

# Update $PATH
export PATH=$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH
```

## Pyenv

pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

### Installation

Use Homebrew to download and install:

```
$ brew install pyenv

# Install your prefered python version
$ pyenv install 2.7.15
$ pyenv install 3.7.0
```

### Customization

Append the following to your ~/.env.sh script

```
# Settings for pyenv
eval "$(pyenv init -)"
```

## pyenv-virtualenvwrapper

### Installation

Using homebrew to download and install:

```
$ brew install pyenv-virtualenvwrapper
```

### Customization

Append the following to your ~/.env.sh script

```
# Settings for pyenv-virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Activate virtualenvwrapper
pyenv shell 2.7.15
pyenv virtualenvwrapper
```

## Python

macOS, like Linux, ships with Python already installed. But you don't want to mess with the system Python (some system tools rely on it, etc.), so we'll install our own version(s). There are two ways to install Python, (1) Homebrew and (2) Pyenv. If you plan to use multiple versions of Python (e.g. 2, 3, and anaconda) then you should use pyenv.

### Installation

Using pyenv to download and install:

```
$ pyenv install 2.7.15
$ pyenv global 2.7.15
$ pyenv rehash
```

### Emacs

Emacs is an extensible, customizable, free/libre text editor — and more.

### Installation

**Using homebrew to download and install:**

```
$ brew tap railwaycat/emacsmacport
$ brew cask install emacs-mac
$ brew untap railwaycat/emacsmacport
```

**Installing dependencies**

```
# For multimedia plugins
$ brew install mplayer

# For w3m plugin
$ brew install w3m

# For go mode plugin
$ go get github.com/rogpeppe/godef
$ go get golang.org/x/tools/cmd/gorename
$ go get golang.org/x/tools/cmd/guru

# For python mode plugin
$ pip install yapf
$ pip install jedi
$ pip install epc

# For easypg
$ brew install gnupg
```

#### Customization

Running _./install.sh_ to setup emacs configurations.

```
$ ./install.sh
```


