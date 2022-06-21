#!/bin/bash

RESULT=0

echo "Checking if the dependencies are in the PATH"

# starship prompt
printf "starship "
if command -v starship &> /dev/null; then
    printf "[ OK ]\n"
else
    printf "[FAIL]\n"
    RESULT=1
fi

# nvm
printf "nvm "
if command -v nvm &> /dev/null; then
    printf "[ OK ]\n"
else
    printf "[FAIL]\n"
    RESULT=1
fi

# pacman
printf "pacman "
if command -v pacman &> /dev/null; then
    printf "[ OK ]\n"
else
    printf "[FAIL]\n"
    RESULT=1
fi

exit "$RESULT"
