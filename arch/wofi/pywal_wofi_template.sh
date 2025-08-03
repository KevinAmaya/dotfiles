#!/bin/bash

# Load pywal colors
source "$HOME/.cache/wal/colors.sh"

# Write static Wofi CSS
cat >"$HOME/.config/wofi/style.css" <<EOF
window {
    background-color: ${background};
    border: 2px solid ${color1};
    box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.4); 
    border-radius: 10px;
    border: 2px solid rgba(108, 112, 134, 0.5);
    border-radius: 10px;
}
#input {
    background-color: ${background};
    color: ${foreground};
    border: none;
    outline: none;
    font-size: 18px;    
    padding: 12px 16px;
    min-height: 48px; 
    border-radius: 8px;
}
#entry {
    padding: 12px 16px;
    margin: 6px 0;
    border-radius: 6px;
}
#entry:selected {
    background-color: ${color2};
    color: ${background};
}
#text {
    color: ${foreground};
}
#text:selected {
    color: ${background};
}
EOF
