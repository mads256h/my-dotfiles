#!/bin/bash

# Android and adb
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

# ccache
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.conf
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache


# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv


# Golang
export GOPATH="$XDG_DATA_HOME"/go


# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle


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


# sagemath
export DOT_SAGE="$XDG_CONFIG_HOME"/sage


# wget
export WGETRC="$XDG_CONFIG_HOME"/wgetrc


# xorg-xauth
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
