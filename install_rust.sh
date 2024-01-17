# colors for outputs
error_color="\033[1;31m"  # color for errors (bold red)
note_color="\033[4;36m"   # color for notations (under-line cyan) 
default_color="\033[m"    # default color (e.g., white)

rustup_path=$(command -v rustup)
if [[ $rustup_path = "" ]]; then
    curl_path=$(command -v curl)
    if [[ $curl_path = "" ]]; then
        echo -e $note_color curl is required to install Rust through rustup $default_color
    else
        echo -e $note_color Installing Rust using rustup...$default_color
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
else
    echo -e $note_color Rust has been installed using rustup, installation path is $rustup_path $default_color
    echo -e "To update Rust, run: rustup update"
fi