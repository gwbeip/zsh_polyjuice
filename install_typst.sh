if [ ! -d $HOME/.software/typst ]; then
    git clone https://github.com/typst/typst.git $HOME/.software/typst
else
    cd $HOME/.software/typst
    echo git pull @ $(pwd)
    git pull
fi

cd $HOME/.software/typst
cargo build -p typst-cli --release

nl $HOME/.software/software_env.sh | grep "export PATH=\$HOME/.software/typst/target/release:\$PATH" > /dev/null
if [ ! $? == 0 ]; then
    echo export PATH=\$HOME/.software/typst/target/release:\$PATH >> $HOME/.software/software_env.sh
fi