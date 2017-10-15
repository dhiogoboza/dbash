#!/bin/bash

echo "Copying files..."
cp customaliases ~/.customaliases
cp customfunctions ~/.customfunctions
cp dbash ~/.dbash
cp dbashaliases ~/.dbashaliases
cp dbashfunctions ~/.dbashfunctions

grep -rnw ~/.bashrc -e "source ~/.dbash"

if [ $? -ne 0 ]; then
    echo "Adding line in ~/.bashrc"
    
    echo "source ~/.dbash" >> ~/.bashrc
fi

echo "Successfully installed!"

source ~/.dbash
