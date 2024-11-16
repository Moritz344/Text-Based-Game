#!/bin/bash
clear
loadingAnimation() {
    local text="$1" # text als lokale var
    local delay=0.1 # delay für sleep

    for word in $text; do
        sleep $delay
        echo -n "$word"
    done

}

charackter() {
    echo "Hi $NAME thank you for playing! "
    tput sgr0
    sleep 1

    echo -n "Do you want to continue to the intro?(y/N)"
    read CHOICE

    if [[ $CHOICE == "y" ]]; then
        echo -n "Okay Lets Start!"
    elif [[ $CHOICE == "N" ]]; then
        loadingAnimation "Q U I T T I N G"
        echo ""
        exit
    else
        echo "what is bro typing"
        tput setaf 1
        echo "$CHOICE: command not found!"
        tput sgr0
        exit
    fi



}

# Charackter Erstellung und Intro
introSeq() {
    local delay=0.5
    
    tput setaf 2
    echo "[ NAME: $NAME] "
    tput sgr0
    echo ""

    tput blink
    loadingAnimation "L O A D I N G . . ."
    tput sgr0
    echo
    sleep 1
    echo "+------------------------------------------------------------------------------------------------------------+"
    echo "You play as an adventurer who breaks into an ancient, abandoned castle to uncover a forgotten secret."
    sleep $delay
    echo "The castle contains various rooms filled with puzzles, traps and monster-like creatures that must be overcome."
    sleep $delay
    echo "+------------------------------------------------------------------------------------------------------------+"
}

#room_1() {}

#room_2() {}


startGame() {
    #charackter
    #loadingAnimation "L O A D I N G ..."
    sleep 1
    introSeq
}
startGame

