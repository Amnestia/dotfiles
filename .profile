export GOPATH=~/workspace/dev/go
export GOBIN=$GOPATH/bin
export GOPROXY=direct
export GOTELEMETRY=off


export DEV_BIN_ENV=$GOBIN

alias update_rust_pkg='rustup update'

alias update_language_pkg="update_rust_pkg ; nvm install-latest-npm ; update_node_module"
alias update_all="update_language_pkg;flatpak update;paru -Syu;vim +PlugUp && update-proton.sh;fastfetch"

export BASH_SCRIPT=~/workspace/script

export ANDROID_HOME=~/workspace/dev/android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk
export ANDROID_CMD_LINE_TOOLS=$ANDROID_SDK_ROOT/cmdline-tools/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_SDK_ROOT/platform-tools
export ANDROID_BIN=$ANDROID_SDK_ROOT:$ANDROID_CMD_LINE_TOOLS/bin:$ANDROID_PLATFORM_TOOLS

export PATH="$PATH:$DEV_BIN_ENV:$BASH_SCRIPT:$ANDROID_BIN"
export PATH="$PATH:/home/amnestia/.local/bin"
export GIT_EDITOR=vim
export HISTTIMEFORMAT="%F %T "
export DRI_PRIME=1
export TERM=screen-256color

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus
export XMODIFIERS="@im=fcitx5"
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1

export WINEPREFIX=~/games/default

. "$HOME/.cargo/env"
