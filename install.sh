#!/bin/bash

attributesfile=~/.gitattributes
imgDiffScript=~/bin/git-imgdiff

addattr() {
    ext="$1"
    if ! grep -qE "^\*.$ext diff=image\$" "$attributesfile"; then
        if ! grep -qE "^\*.$ext" "$attributesfile"; then
            echo "=> Adding '*.$ext diff=image' in $attributesfile"
            echo "*.$ext diff=image" >> $attributesfile
        fi
    fi
}

if [ ! -f ~/.customaliases ]; then
    echo "=> Copying customaliases file..."
    cp customaliases ~/.customaliases
fi

if [ ! -f ~/.customfunctions ]; then
    echo "=> Copying customfunctions file..."
    cp customfunctions ~/.customfunctions
fi

if [ ! -f ~/.inputrc ]; then
    echo "=> Copying customfunctions file..."
    cp inputrc ~/.inputrc
fi

# git image diff utility

if ! command -v imagemagick &>/dev/null; then
    echo "=> Installing imagemagick"
    sudo apt install imagemagick
fi

if ! command -v git &>/dev/null; then
    echo "=> Installing git"
    sudo apt install git
fi

if [ ! -f $imgDiffScript ]; then
    cp git/git-imgdiff $imgDiffScript
fi

addattr gif
addattr jpeg
addattr jpg
addattr png
addattr svg

git config --global core.attributesFile $attributesfile
git config --global diff.image.command $imgDiffScript

if ! command -v yad &>/dev/null; then
    echo "=> Installing yad for git image diff"
    sudo apt install yad
fi

# git image diff utility end

cp dbash ~/.dbash
cp dbashaliases ~/.dbashaliases
cp dbashfunctions ~/.dbashfunctions

grep -rnw ~/.bashrc -e "source ~/.dbash" >/dev/null

if [ $? -ne 0 ]; then
    echo "=> Adding 'source ~/.dbash' in ~/.bashrc"
    echo "source ~/.dbash" >>~/.bashrc
fi

echo "Successfully installed!"

source ~/.dbash
