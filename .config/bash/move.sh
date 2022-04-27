#!/bin/bash

# Android and adb
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

# bash
export HISTFILE="$XDG_STATE_HOME"/bash/history

# ccache
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.conf
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache


# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv


# Golang
export GOPATH="$XDG_DATA_HOME"/go


# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle


# GTK 2.0
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc-2.0

# ipython / jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter


# maxima
export MAXIMA_USERDIR="$XDG_CONFIG_HOME"/maxima


# ncurses
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo


# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc


# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages


# Rust cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup


# sagemath
export DOT_SAGE="$XDG_CONFIG_HOME"/sage


# wget
export WGETRC="$XDG_CONFIG_HOME"/wgetrc


# xorg-xauth
mkdir "$XDG_RUNTIME_DIR"/gdm 2>/dev/null
export XAUTHORITY="$XDG_RUNTIME_DIR"/gdm/Xauthority


# octave
export OCTAVE_HISTFILE="$XDG_CACHE_HOME"/octave_hist
