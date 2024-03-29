#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DESKTOP_DIR="$(xdg-user-dir DESKTOP)"
export XDG_DOCUMENTS_DIR="$(xdg-user-dir DOCUMENTS)"
export XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
export XDG_MUSIC_DIR="$(xdg-user-dir MUSIC)"
export XDG_PICTURES_DIR="$(xdg-user-dir PICTURES)"
export XDG_PUBLICSHARE_DIR="$(xdg-user-dir PUBLICSHARE)"
export XDG_TEMPLATES_DIR="$(xdg-user-dir TEMPLATES)"
export XDG_VIDEOS_DIR="$(xdg-user-dir VIDEOS)"

# Private dir
export PRIVATE_DIR="$HOME/Private"
