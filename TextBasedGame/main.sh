#!/bin/bash
source ./sceneAscii.sh

ROOM=0
WHERE="ENTRANCE"
kapitel=0


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

Status() {
    #tput setaf 2
    echo "[ NAME: $NAME] [ ROOM: $ROOM ] [ WHERE: $WHERE ] [ CHAPTER: $kapitel ]"
    #tput sgr0
    echo ""

    echo $pwd
}

# Charackter Erstellung und Intro
introSeq() {
    local delay=0.5
    
    Status

    #tput blink
    #loadingAnimation "L O A D I N G . . ."
    #tput sgr0
    tput setaf 2
    echo ""
    echo -n "[Ascii Picture]"
    tput sgr0
    echo ""
    castle
    sleep 5
    echo "+---------------------------------------------------------------------------------------------------+"
    echo "You play as an adventurer who breaks into an ancient, abandoned castle to uncover a forgotten secret."
    sleep $delay
    echo "The castle contains various rooms filled with puzzles, traps and monster-like creatures that must be overcome."
    sleep $delay
    echo "+---------------------------------------------------------------------------------------------------+"
    tput blink
    echo -n "Continue (y/N)"
    tput sgr0
    read CHOICE

    if [[ $CHOICE == "y" ]]; then
        echo "+-------------------------------------------------+"
        sleep 1
        echo ""
        echo "You find yourself standing before the castel gates."
        sleep 2
        tput blink
        echo "The ancient stone structure looms in the fog."
        tput sgr0
        sleep 2
        echo "As you step inside, the door creaks and shuts behind you."
        sleep 2
        echo ""
        echo "+-------------------------------------------------+"
        echo ""
        echo -n "Continue? (y/N)"
        read next
        
        if [[ $next == "y" ]]; then
            echo ""
        elif [[ $next == "N" ]]; then
            tput setaf 1
            echo "I will end the session. Everything will be resetted."
            tput sgr0

     else
         echo "BYE!!!" 
         exit

   fi
   fi
}

room_1() {
    echo ""
}

room_2() {

    echo ""
}

room_3() {

    echo ""
}

kapitel1() {
    hallway
    echo ""
    echo "There are alot of rooms infront of you."
    echo ""
    sleep 1
    tput setab 2
    echo -n "Which one will you enter? (1/2/3)"
    tput sgr0

    read NUMBER

    if [[ $NUMBER == "1" ]]; then
        room_1
    elif [[ $NUMBER == "2" ]]; then
        room_2
    elif [[ $NUMBER == "3" ]]; then
        room_3
    fi
}


startGame() {
    #charackter
    #loadingAnimation "L O A D I N G ..."
    #sleep 1
    introSeq
    if [[ $CHOICE == "y" ]]; then
        kapitel1
    else
        exit
    fi

}
startGame

