error_color="\033[1;31m"  # color for errors (bold red)
note_color="\033[4;36m"   # color for notations (under-line cyan) 
default_color="\033[m"    # default color (e.g., white)


whereis cargo
if [ ! $? == 0 ]; then
    echo -e $error_color Install "cargo" first! $default_color
fi

if [ ! -d $HOME/.software/typst ]; then
    echo -e "$note_color git clone -> $HOME/.software/typst$default_color"
    git clone https://github.com/typst/typst.git $HOME/.software/typst
else
    cd $HOME/.software/typst
    echo -e $note_color git pull @ $(pwd)$default_color
    # git pull
fi

cd $HOME/.software/typst
echo -e $note_color build typst @ $(pwd) $default_color
cargo build -p typst-cli --release

nl $HOME/.software/software_env.sh | grep "export PATH=\$HOME/.software/typst/target/release:\$PATH" > /dev/null
if [ ! $? == 0 ]; then
    echo -e $note_color Write $HOME/.software/typst/target/release to \$PATH$default_color
    echo export PATH=\$HOME/.software/typst/target/release:\$PATH >> $HOME/.software/software_env.sh
fi