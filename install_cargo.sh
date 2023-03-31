# colors for outputs
error_color="\033[1;31m"  # color for errors (bold red)
note_color="\033[4;36m"   # color for notations (under-line cyan) 
default_color="\033[m"    # default color (e.g., white)

whereis cargo
if [ $? == 0 ]; then
    echo -e $note_color Cargo is installed, updating cargo...$default_color
    rustup update
else
    echo -e $note_color Installing Cargo using rustup...$default_color
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi