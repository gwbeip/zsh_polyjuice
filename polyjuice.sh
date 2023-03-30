#!/bin/bash

if [ ! -d $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
fi

if [ ! -d $HOME/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ ! -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if [ ! -d $HOME/.oh-my-zsh/plugins/zsh-autocomplete ]; then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.oh-my-zsh/plugins/zsh-autocomplete
fi

if [ -f $HOME/.zshrc ]; then
    if [ ! -f $HOME/.zshrc.bkp ]; then
        mv $HOME/.zshrc $HOME/.zshrc.bkp
    fi
fi
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

zsh_theme_line_num=$(grep -rn -m 1 ZSH_THEME= $HOME/.zshrc | cut -d ":" -f 1)
sed -i $zsh_theme_line_num"c"\ZSH_THEME=\"polyjuice\"  $HOME/.zshrc

zsh_plugin_line_number=$(grep -rn -m 2 plugins=\(git\)  $HOME/.zshrc | cut -d : -f 1)
sed -i "$zsh_plugin_line_number"c"\plugins=\(zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete\)"  $HOME/.zshrc

if [ -f $HOME/.oh-my-zsh/themes/polyjuice.zsh-theme ]; then 
    rm -rf $HOME/.oh-my-zsh/themes/polyjuice.zsh-theme
fi

path_to_theme=$(realpath $0 | sed 's/\.sh/\.zsh-theme/')
ln -i -s $path_to_theme $HOME/.oh-my-zsh/themes/polyjuice.zsh-theme
