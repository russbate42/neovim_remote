#!/bin/bash

# opts
TMUX_CONF=false
while [[ $# -gt 0 ]]; do
    case ${1} in
        -t|--test)
            TMUX_CONF=true
            shift
            ;;
        -*|--*)
            echo "Unknown option ${1}"
            exit 1
            ;;
    esac
done

## TMUX
if [[ $TMUX_CONF -eq true ]]; then
    echo "Setting up TMUX"
    echo "ln -s -T .tmux.conf ~/.tmux.conf"
    ln -s -T .tmux.conf ~/.tmux.conf
fi

## Link NeoVim
# Check for .config directory
if [ -d ~/.config ]; then
	echo "--> .config directory exists"
else
	echo "--> .config directory does not exist"
	echo "--> Creating config directory"
	mkdir ~/.config
fi

# Check for nvim directory
if [ -d ~/neovim_remote/nvim ]; then
	echo "--> Linking nvim config to ~/.config"
    cp -rsT nvim ~/.config/nvim	
else
	echo "--> nvim does not exists!"
	exit 1
fi

echo "--> Cloning packer into .local directory ..."

if [ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
    echo -e "--> Packer already exists! \n"
else
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

echo -e "--> Done ...\n"

