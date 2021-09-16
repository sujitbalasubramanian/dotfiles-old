#!/bin/bash

xdg-open "$(locate home media | rofi -threads 0 -width 90 -dmenu -i -p "locate")"
