#!/usr/bin/env bash

# clone git submodules for dotfiles...
cd ~/.dotfiles
git submodule update --recursive --init
