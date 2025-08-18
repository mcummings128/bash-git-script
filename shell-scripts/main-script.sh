#!/bin/bash
# ^Shebang line. It TODO EXPLAIN

# Globals, defined outside the scope of a function
# Turn this on if you want a lot of echo's
VERBOSE=false

# Still globals, but less important
readonly DASH="-------"
readonly MAIN_OPT= "[main] Main menu"
readonly RED="\e[31m"
readonly GREEN="\e[32m"
readonly YELLOW="\e[33m"
readonly BLUE="\e[34m"
readonly MAGENTA="\e[35m"
readonly CYAN="\e[36m"
readonly LIGHT_GREY="\e[37m"
readonly GREY="\e[90m"
readonly BOLD_GREY="\e[90m"
readonly LIGHT_RED="\e[91m"
readonly LIGHT_GREEN="\e[92m"
readonly LIGHT_YELLOW="\e[93m"
readonly LIGHT_BLUE="\e[94m"
readonly LIGHT_MAGENTA="\e[95m"
readonly LIGHT_CYAN="\e[96m"
readonly WHITE="\e[97m"
readonly GREY_BG="\e[47m"
readonly VERBOSE_FORMAT="\e[1;100m"
readonly DONE="\e[0m"
 
run()
{
    echo -e "Welcome!\n"
    verbose_echo "VERBOSE is on"
    list_choices_and_execute_for "main"
}

set_verbose()
{
    #TODO: Better echo's
    echo -e "VERBOSE is currently set to ${VERBOSE}"
    echo -e "If VERBOSE is set to on, you will see extra messages " $(verbose_echo "formatted like this") "to assist in debugging."
    [[ $VERBOSE = true ]] && CHG="Keep" || CHG="Turn"
    echo "${CHG} VERBOSE on? y for yes" 
    read CHOICE
    if [ $CHOICE = "y" ]
    then
        VERBOSE=true
    fi
    continue_or_quit "main"
}

verbose_echo()
{
    V_STRING=$1
    if $VERBOSE; then
        echo "${VERBOSE_FORMAT}${V_STRING}${DONE}"
    fi
}

list_choices_and_execute_for()
{
    SET=$1
    user_choice="" #user input
    list_choices $SET
    read USER_CHOICE
    execute_based_on_choice $USER_CHOICE "main"
}

list_choices()
{
    SET=$1
    case $SET in
        main)
            echo -e "Please make a selection \n"
            echo "[1] CODEOWNERS Testing Suite"
            echo "[2] TBD"
            echo "[3] Verbose ON/OFF"
            echo -e "[q] Quit \n"
            ;;
        CODEOWNERS)
            echo -e "\n${DASH}CODEOWNERS Testing Suite${DASH}\n"
            echo "[1] Read through CODEOWNERS (no comments)"
            echo "[2] TBD"
            echo -e "[3] TBD \n"
            ;;
        debug)
            echo "TBD"
            ;;
        *)
            echo "Invalid selection"
            ;;
    esac
}

execute_based_on_choice()
{
    CHOICE=$1
    TYPE=$2
    case $TYPE in
        main)
            case $CHOICE in
                1)
                    list_choices_and_execute_for "CODEOWNERS"
                    ;;
                2)
                    echo "TBD"
                    ;;
                3)
                    set_verbose
                    ;;
                *)
                    echo "OK"
                    ;;
            esac
            ;;
        CODEOWNERS)
            echo "execute_based_on_choice(): CODEOWNERS hit! CHOICE = ${CHOICE}"
            case $CHOICE in
                1)
                    echo "OMG"
                    ;;
                *)
                    echo "YAY"
                    ;;
            esac
            ;;
        *)
            verbose_echo "execute_based_on_choice: Invalid TYPE"
            echo "Invalid TYPE"
    esac
}

continue_or_quit()
{
    menu_type=$1
    echo "To return to the main menu, type 1 or main. To quit, press q or any other key"
    read decision
    if [ $menu_type = "main" ]
    then 
        if [ $decision = "main" ]
        then
            echo "MAIN"
            run
        else
            echo "Quitting. Bye!"
            exit
        fi
    else
        echo "continue_or_quit(): Invalid menu_type ($menu_type)"
    fi
}


# Script is actually run here

run