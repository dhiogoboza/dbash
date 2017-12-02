#!/bin/bash

echo "Copying files..."
if [ ! -f ~/.customfunctions ]; then
    cp customaliases ~/.customaliases
fi

if [ ! -f ~/.customfunctions ]; then
    cp customfunctions ~/.customfunctions
fi

cp dbash ~/.dbash
cp dbashaliases ~/.dbashaliases
cp dbashfunctions ~/.dbashfunctions
cp bash_preexec ~/.bash_preexec
cp dbashnotify ~/.dbashnotify

grep -rnw ~/.bashrc -e "source ~/.dbash"

if [ $? -ne 0 ]; then
    echo "Adding line in ~/.bashrc"
    
    echo "source ~/.dbash" >> ~/.bashrc
fi

echo "Successfully installed!"

source ~/.dbash
