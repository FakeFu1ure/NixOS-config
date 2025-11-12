#!/bin/bash

MENU_PROCESS="fuzzel"
MENU_COMMAND="fuzzel"

if pgrep -x "$MENU_PROCESS" > /dev/null; then
  
    pkill -x "$MENU_PROCESS"
else
   
    eval "$MENU_COMMAND" &
fi
