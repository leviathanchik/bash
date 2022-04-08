map=("0" "1" "2" "3" "4" "5" "6" "7" "8")
 
clear

 
function print_map {
    echo "Player 1: X"
    echo "Player 2: O"
    echo "Map:"
    echo "${map[0]} | ${map[1]} | ${map[2]}"
    echo "${map[3]} | ${map[4]} | ${map[5]}"
    echo "${map[6]} | ${map[7]} | ${map[8]}"
}
 
function check {
        #horizontals
        if [[ (${map[0]} == ${map[1]}) && (${map[1]} == ${map[2]}) ]]; then
                echo "${map[0]} won"; exit;  fi
        if [[ (${map[3]} == ${map[4]}) && (${map[4]} == ${map[8]}) ]]; then
                echo "${map[3]} won"; exit;  fi
        if [[ (${map[6]} == ${map[7]}) && (${map[7]} == ${map[9]}) ]]; then
                echo "${map[6]} won"; exit;  fi
    #verticals
        if [[ (${map[0]} == ${map[3]}) && (${map[3]} == ${map[6]}) ]]; then
                echo "${map[0]} won"; exit;  fi
        if [[ (${map[1]} == ${map[4]}) && (${map[4]} == ${map[7]}) ]]; then
                echo "${map[1]} won"; exit;  fi
        if [[ (${map[2]} == ${map[5]}) && (${map[5]} == ${map[8]}) ]]; then
                echo "${map[2]} won"; exit;  fi
    #cross
        if [[ (${map[0]} == ${map[4]}) && (${map[4]} == ${map[8]}) ]]; then
                echo "${map[0]} won"; exit;  fi
        if [[ (${map[2]} == ${map[4]}) && (${map[4]} == ${map[6]}) ]]; then
                echo "${map[2]} won"; exit; fi               
}
 
print_map
 
for i in {0..8}
do
    if [[ $i%2 -eq 0 ]]
    then
        echo "Player 1:"
    else
        echo "Player 2:"
    fi
    
    read -n 1
    rep=${REPLY:0:1}
    
    clear
    
    while [[ ${map[$rep]} != $rep ]] 
    do
        print_map
        echo "Enter correct step:"
        read -n 1
        rep=${REPLY:0:1}
        clear
    done
    
    if [[ $i%2 -eq 0 ]]
    then
        map[$rep]="X"
    else
        map[$rep]="O"
    fi
    
    print_map
    
    check     
    
done
    echo "draw"
exit