#!/bin/bash

run()
{
    echo "Welcome!"
}

list_choices(){
    SET=$1
    case $SET in
    main)
        echo "main"
        ;;
    *)
        echo "Invalid selection"
        ;;
    esac
}