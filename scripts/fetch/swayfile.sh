#!/bin/bash

[ -d .config ] || mkdir -p .config
cp -r ~/.config/waybar .config/
cp -r ~/.config/sway .config/
