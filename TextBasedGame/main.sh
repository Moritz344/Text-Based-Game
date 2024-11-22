#!/bin/bash
source ./sceneAscii.sh


ROOM=0
WHERE="ENTRANCE"
kapitel=0
declare -a ITEMS

bookshelve() {

    echo -e "
       .--.                   .---.
   .---|__|           .-.     |~~~|
.--|===|--|_          |_|     |~~~|--.
|  |===|  |'\     .---!~|  .--|   |--|
|%%|   |  |.'\    |===| |--|%%|   |  |
|%%|   |  |\.'\   |   | |__|  |   |  |
|  |   |  | \  \  |===| |==|  |   |  |
|  |   |__|  \.'\ |   |_|__|  |~~~|__|
|20|===|--|   \.'\|===|~|--|%%|~~~|--|
^--^---'--^    ---^-^--^--^---'--' hjw
"

}


helpFunction_1() {
    

    if [[ $ROOM == 1 ]]; then
        room_1
    elif [[ $ROOM == 2 ]]; then
        room_2
    elif [[ $ROOM == 3 ]]; then
        room_3
    fi
}
#helpFunction_1


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

}

# Charackter Erstellung und Intro
introSeq() {
    local delay=0.5
    
    resetScreen

    #tput blink
    #loadingAnimation "L O A D I N G . . ."
    #tput sgr0
    tput setaf 2
    echo ""
    echo -n "[ASCII IMAGE]"
    tput sgr0
    echo ""
    entrance
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
         exit

   fi
   fi
}

room_1() {
    clear
    # Libary
    # Items
    ROOM=1
    WHERE="ROOM1 NAME"
    Status
    room_1_ascii
    echo ""
    tput setaf 1
    echo -n "INFO: You entered room 1."
    tput sgr0
    echo ""

    echo  "What would you like to do?(1/2/3/4) "
    echo ""
    echo  "1. Inspect the statue at the far end of the room."
    echo ""
    echo  "2. Approach the wall and examine the flickering torch."
    echo ""
    echo "3. Leave trough the door."
    echo ""
    tput setaf 2
    echo -n "$ "
    tput sgr0
    read nextStep1
    echo $nextStep1

    if [[ $nextStep1 == "1" ]]; then
        resetScreen
        tput setaf 2
        echo "[ASCII IMAGE]"
        tput sgr0
        sculpture
        echo ""
        echo "The statue looks really old ..."
        echo ""
        echo -n "What would you like to do? (1/2)"
        echo ""
        echo "1. Leave "

        read auswahl

        if [[ $auswahl == "1" ]]; then
            room_1
        echo ""
        fi

    elif [[ $nextStep1 == "2" ]]; then
        resetScreen
        tput blink
        torch
        tput sgr0
        echo ""
        tput sgr0
        echo ""
        echo "What would you like to do?"
        echo "1. Go back"
        echo -n "$ "
        read torchChoice

        if [[ $torchChoice == "1" ]]; then
            room_1
    fi
    elif [[ "$nextStep1" == "3" ]]; then
        ROOM=0
        WHERE="HALLWAY"
        resetScreen
        kapitel1
    fi

}

room_2Puzzle() {

        # RÄTSELLÖSUNG: Zebra Esel Hase Nilpferd = ZEHN = CODE: 10 
        ROOM=2
        WHERE="ROOM 2 NAME"
        resetScreen
        room_2_ascii
        tput setaf 2
        echo "INFO: you entered room 2"
        tput sgr0
        echo ""

        echo "What would you like to do? (1/2)"
        echo ""
        echo "1. Inspect the suspicious wall"
        echo "2. Inspect the book that is on the desk"
        echo "3. Leave through the door."
        echo ""
        tput setaf 2
        echo -n "$"
        tput sgr0

        read auswahl

        if [[ $auswahl == "1" ]]; then
            resetScreen
            echo -e "
                ++++++++++++++++++++++
                ++++++++++++++++++++++
                ++++++++++++++++++++++
                +++?+++?++++?+++++++++
                ++++++++++++++++++++++
                ++++++++++++++++++++++
                ++++++++++++++++++++++
            "
            echo "What would you like to do?(1/2)"
            echo ""
            echo "1. Go back"
            echo ""
            echo -n "$"

            read answer
            if [[ $answer == "1" ]]; then
                room_2Puzzle
            fi



        elif [[ $auswahl == "2" ]]; then
            resetScreen
            book
            echo "'The wall is covered in ancient symbols.'"
            echo "'The ancient symbols represent animals such as the tiger, elephant and narwhal.'"
            echo ""
            echo "What would you like to do?(1/2) "
            echo ""
            echo "1. Go back"
            tput setaf 2
            echo -n "$"
            tput sgr0

            read answer2

            if [[ $answer2 == "1" ]]; then
                room_2Puzzle
            fi

            
            


        elif [[ $auswahl == "3" ]]; then
            kapitel1
        fi


}

room_2() {
    tput setaf 1   
    echo "Please give the 4 digit code to enter ..."
    tput sgr0
    echo ""
    echo "1. To leave"
    echo ""
    tput setaf 2
    echo -n "$ "
    tput sgr0
    read CODE
    if [[ $CODE == 1794 ]]; then
        room_2Puzzle
    elif [[ $CODE == "1" ]]; then
        kapitel1
    else
        echo "Please try again."
        sleep 2
        room_2
        

    fi



}

room_3_situation() {
        ROOM=3
        WHERE="ROOM 3 NAME"
        resetScreen
        room_3_ascii
        echo ""
        echo "What would you like to do? (1/2/3) "
        echo "1. Look at the bookshelves."
        echo "2. Look at the clock. "
        echo "3. Leave through the door."
        echo ""
        tput setaf 2
        echo -n "$ "
        tput sgr0
        read answer3

        if [[ $answer3 == "1" ]]; then
            resetScreen
            echo ""
            bookshelve
            echo ""
            echo "What would you like to do?(1/2)"
            echo ""
            echo "1. Leave"
            echo ""
            tput setaf 2
            echo -n "$ "
            tput sgr0
            read choice

            if [[ $choice == "1" ]]; then
                room_3_situation
            fi




        elif [[ $answer3 == "2" ]]; then
            resetScreen
            clock
            echo "Its currently about 10 to 11 pm"
            echo ""
            echo "What would you like to do?(1/2)"
            echo "1. Leave"
            echo ""
            tput setaf 2
            echo -n "$ "
            tput sgr0
            read answer4

            if [[ $answer4 == "1" ]]; then
                room_3_situation
            fi


        elif [[ $answer3 == "3" ]]; then
           kapitel1 
        fi
}

room_3() {
    tput setaf 1
    echo "Please type in the code to enter."
    echo ""
    tput sgr0
    echo "1. To Leave."
    echo ""
    tput setaf 2
    echo -n "$ "
    tput sgr0

    read code3

    if [[ $code3 == "10" ]]; then
        room_3_situation
    elif [[ $code3 == "1" ]]; then
        kapitel1

    else 
        tput setaf 1
        echo "Please try again."
        tput sgr0
        room_3

    fi



}

resetScreen() {
    clear
    Status
}

kapitel1() {
    kapitel=1
    Status
    hallway
    echo ""
    echo "There are a lot of rooms infront of you."
    echo ""
    sleep 1
    echo "Which one will you enter? (1/2/3)"
    tput setaf 2
    echo -n "$ "
    tput sgr0

    read NUMBER

    if [[ $NUMBER == "1" ]]; then
        room_1
    elif [[ $NUMBER == "2" ]]; then
        room_2
    elif [[ $NUMBER == "3" ]]; then
        room_3
    else 
        echo "Please try again."
        echo ""
        sleep 1
        kapitel1
    fi
}


startGame() {
    #charackter
    #loadingAnimation "L O A D I N G ..."
    #sleep 1
    #introSeq
    #if [[ $CHOICE == "y" ]]; then
        #clear
        #kapitel1
    #else
        #exit
    #fi
    kapitel1

}
tput cnorm
startGame

