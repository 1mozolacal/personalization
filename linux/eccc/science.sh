#!/bin/bash
#Calvin's linux Customization for SCS Moon server


# Vtune stuff
. ssmuse-sh -x main/opt/intelcomp/intelpsxe-cluster-19.0.3.199
export VTUNE_AMPLIFIER_2019_DIR=${INTELCOMP_HOME}/vtune_amplifier_2019.3.0.591499
export PKG_CONFIG_PATH=${VTUNE_AMPLIFIER_2019_DIR}/include/pkgconfig/lib64:$PKG_CONFIG_PATH
export PATH=${VTUNE_AMPLIFIER_2019_DIR}/bin64:$PATH

###Alias

#Alias - ls
alias ll='ls -l';
alias ls='ls --color=auto';
alias la='ls -a';

#Alias - cd


###Colours

#Colours List
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]'
BLUE='\[\e[1;34m\]'
NC='\[\e[0m\]' # No Color

#Colour prompt
export PS1="${debian_chroot:+($debian_chroot)}\[\e[1;36m\]CALVIN(\u)\[\e[0;29m\]@\[\e[0;34m\]\h \[\e[0;36m\]\@ \w\[\e[0;32m\]$"
#Default => ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ 

function showall(){
    export PS1="${debian_chroot:+($debian_chroot)}\[\e[1;36m\]CALVIN(\u)\[\e[0;29m\]@\[\e[0;34m\]\h \[\e[0;36m\]\@ \w\[\e[0;32m\]$"
}

function showtime(){
    export PS1="\[\e[0;36m\]\@ \[\e[0;32m\]$"
}

function shownothing(){
    export PS1="\[\e[0;32m\]$"
}

function showdir(){
    export PS1="\[\e[0;36m\]\w \[\e[0;32m\]$"
}



#LS Colour
colours="di=4;34:*=;32:*.calvin=;93"
export LS_COLOR=$colours


###MISC commands

function zzz (){
    echo "Sad to see you go, don't forget to give mittens some pats on your way out."
    printSleepyCat
    sleep 1
    genWholesomeLineGoodBye
    echo $generatedWholesomeLine
    sleep .5
    clear 
    exit
}
function genWholesomeLineGoodBye(){
    generatedWholesomeLine="Hi"
    selector=$(( RANDOM % 6))
    if [[ $selector -eq 0 ]]
    then
        generatedWholesomeLine="Take care :)"
    elif [[ $selector -eq 1 ]]
    then
        generatedWholesomeLine="Remember to get lots of sleep"
    elif [[ $selector -eq 2 ]]
    then
        generatedWholesomeLine="Don't over work yourself"
    elif [[ $selector -eq 3 ]]
    then
        generatedWholesomeLine="Hi to your friends for me"
    elif [[ $selector -eq 4 ]]
    then
        generatedWholesomeLine="See ya next time"
    elif [[ $selector -eq 5 ]]
    then
        generatedWholesomeLine="Do something nice for yourself"
    else
        generatedWholesomeLine="Don't forget about self care"
    fi
}

function printSleepyCat() {

echo '      |\      _,,,---,,_'
echo 'ZZZzz /,`.-```    -.  ;-;;,_'
echo '     |,4-  ) )-,_. ,\ (  ``-`'
echo '    `---``(_/--`  `-`\_)  Felix Lee '

}

printSleepyCat

