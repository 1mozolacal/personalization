#!/bin/bash
#Calvin's linux Customization for SCS Moon server


###Alias

#Alias - ls
alias ll='ls -l';
alias ls='ls --color=auto';

#Alias - cd
alias work='cd ~/workspace/courses'
alias workspace='cd ~/workspace'
alias cd633='cd ~/workspace/courses/cps633'
alias cd510='cd ~/workspace/courses/cps510'
alias cdweb='cd ~/public_html'
alias cdgit='~/workspace/git'

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
export PS1="${debian_chroot:+($debian_chroot)}\e[1;36mLORD CALVIN(\u)\e[0;29m@\e[0;34m\h \e[0;36m\@\e[0;32m~$"
#Default => ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ 

#LS Colour
colours="di=4;34:*=;32:*.calvin=;93"
export LS_COLOR=$colours


###MISC commands

function zzz (){
    echo 'Sad to see you go, don't forget to give mittens some pats on your way out.'
    printSleepyCat
    sleep 3

    genWholesomeLineGoodBye
    echo $generatedWholesomeLine
    sleep .5
    
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

#Welcome Message

function printWelcomCalvin(){
    selector=$(( RANDOM % 6))
    if ! [ -z "$1" ];then
        selector=$1
    fi

    if [[ $selector -eq 0 ]]
    then
        printDragon
    elif [[ $selector -eq 1 ]]
    then
        printSleepyCat
    elif [[ $selector -eq 2 ]]
    then
        printSwords
    elif [[ $selector -eq 3 ]]
    then
        printWelcomCalvinOne
    elif [[ $selector -eq 4 ]]
    then
        printWelcomCalvinTwo
    elif [[ $selector -eq 5 ]]
    then
        printSwords
        printWelcomCalvinTwo
        printSwords
    else
        echo "Welcome Calvin"
    fi

}

function printDragon() {
    echo '                                        ,   ,                                '
    echo '                                        $,  $,     ,                         '
    echo '                                        "ss.$ss. .s`                         '
    echo '                                ,     .ss$$$$$$$$$$s,                        '
    echo '                                $. s$$$$$$$$$$$$$$`$$Ss                      '
    echo '                                "$$$$$$$$$$$$$$$$$$o$$$       ,              '
    echo '                               s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s               '
    echo '                              s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,             '
    echo '                              s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"             '
    echo '                             s$$$$$$$$$$`         `"""ss"$"$s""              '
    echo '                             s$$$$$$$$$$,              `"""""$  .s$$s        '
    echo '                             s$$$$$$$$$$$$s,...               `s$$`  `       '
    echo '                         `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-   '
    echo '                           `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$`    '
    echo ' Posable artist:                 "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|     '
    echo '   -Tua Xiong                      "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $    '
    echo '                                   $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `    '
    echo '                                  $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""`         '
    echo '                             ,   ,"     `  $$$$$$$$$$$$$$$$####s             '
    echo '                             $.          .s$$$$$$$$$$$$$$$$$####"            '
    echo '                 ,           "$s.   ..ssS$$$$$$$$$$$$$$$$$$$####"            '
    echo '                 $           .$$$S$$$$$$$$$$$$$$$$$$$$$$$$#####"             '
    echo '                 Ss     ..sS$$$$$$$$$$$$$$$$$$$$$$$$$$$######""              '
    echo '                  "$$sS$$$$$$$$$$$$$$$$$$$$$$$$$$$########"                  '
    echo '           ,      s$$$$$$$$$$$$$$$$$$$$$$$$#########""`                      '
    echo '           $    s$$$$$$$$$$$$$$$$$$$$$#######""`      s`         ,           '
    echo '           $$..$$$$$$$$$$$$$$$$$$######"`       ....,$$....    ,$            '
    echo '            "$$$$$$$$$$$$$$$######"` ,     .sS$$$$$$$$$$$$$$$$s$$            '
    echo '              $$$$$$$$$$$$#####"     $, .s$$$$$$$$$$$$$$$$$$$$$$$$s.         '
    echo '   )          $$$$$$$$$$$#####`      `$$$$$$$$$###########$$$$$$$$$$$.       '
    echo '  ((          $$$$$$$$$$$#####       $$$$$$$$###"       "####$$$$$$$$$$      '
    echo '  ) \         $$$$$$$$$$$$####.     $$$$$$###"             "###$$$$$$$$$   s`'
    echo ' (   )        $$$$$$$$$$$$$####.   $$$$$###"                ####$$$$$$$$s$$` '
    echo ' )  ( (       $$"$$$$$$$$$$$#####.$$$$$###`                .###$$$$$$$$$$"   '
    echo ' (  )  )   _,$"   $$$$$$$$$$$$######.$$##`                .###$$$$$$$$$$     '
    echo ' ) (  ( \.         "$$$$$$$$$$$$$#######,,,.          ..####$$$$$$$$$$$"     '
    echo '(   )$ )  )        ,$$$$$$$$$$$$$$$$$$####################$$$$$$$$$$$"       '
    echo '(   ($$  ( \     _sS"  `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$S$$,       '
    echo ' )  )$$$s ) )  .      .   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"`  `$$      '
    echo '  (   $$$Ss/  .$,    .$,,s$$$$$$##S$$$$$$$$$$$$$$$$$$$$$$$$S""        `      '
    echo '    \)_$$$$$$$$$$$$$$$$$$$$$$$##"  $$        `$$.        `$$.                '
    echo '        `"S$$$$$$$$$$$$$$$$$#"      $          `$          `$                '
    echo '            `"""""""""""""`         `           `           `                '
}


function printSleepyCat() {

echo '      |\      _,,,---,,_'
echo 'ZZZzz /,`.-```    -.  ;-;;,_'
echo '     |,4-  ) )-,_. ,\ (  ``-`'
echo '    `---``(_/--`  `-`\_)  Felix Lee '

}

function printSwords(){

echo '           /\                                                 /\'
echo ' _         )( ______________________   ______________________ )(         _'
echo '(_)///////(**)______________________> <______________________(**)\\\\\\\(_)'
echo '           )(                                                 )('
echo '           \/                                                 \/'

}

function printWelcomCalvinOne() {

echo '                                             _..._       .-```-.                                        '
echo '                                 .---.    .-`_..._``.   `   _    \                                      '
echo '                   __.....__     |   |  .` .`      `.\/   /` `.   \  __  __   ___         __.....__     '
echo '       _     _ .-``         `.   |   | / .`          .   |     \  ` |  |/  `.`   `.   .-``         `.   '
echo ' /\    \\   ///     .-``"`-.  `. |   |. `            |   `      |  `|   .-.  .-.   ` /     .-``"`-.  `. '
echo ' `\\  //\\ ///     /________\   \|   || |            \    \     / / |  |  |  |  |  |/     /________\   \'
echo '   \`//  \`/ |                  ||   || |             `.   ` ..` /  |  |  |  |  |  ||                  |'
echo '    \|   |/  \    .-------------`|   |. `                `-...-``   |  |  |  |  |  |\    .-------------`'
echo '     `        \    `-.____...---.|   | \ `.          .              |  |  |  |  |  | \    `-.____...---.'
echo '               `.             .` |   |  `. `._____.-`/              |__|  |__|  |__|  `.             .` '
echo '       _..._     ```-...... -`   `---`    `-.______ /                                   ```-...... -`   '
echo '    .-`_..._``.           .---.                    `                                                    '
echo '  .` .`      `.\          |   |.----.     .----..--.   _..._                                            '
echo ' / .`                     |   | \    \   /    / |__| .`     `.                                          '
echo '. `                       |   |  `   `. /`   /  .--..   .-.   .                                         '
echo '| |                 __    |   |  |    |`    /   |  ||  `   `  |                                         '
echo '| |              .:--.`.  |   |  |    ||    |   |  ||  |   |  |                                         '
echo '. `             / |   \ | |   |  `.   ``   .`   |  ||  |   |  |                                         '
echo ' \ `.          .`" __ | | |   |   \        /    |  ||  |   |  |                                         '
echo '  `. `._____.-`/ .`.``| | |   |    \      /     |__||  |   |  |                                         '
echo '    `-.______ / / /   | |_`---`     `----`          |  |   |  |                                         '
echo '             `  \ \._,\ `/                          |  |   |  |                                         '
echo '                 `--`  `"                           `--`   `--`'

}

function printWelcomCalvinTwo(){

echo ' /$$      /$$           /$$                                            '
echo '| $$  /$ | $$          | $$                                            '
echo '| $$ /$$$| $$  /$$$$$$ | $$  /$$$$$$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$ '
echo '| $$/$$ $$ $$ /$$__  $$| $$ /$$_____/ /$$__  $$| $$_  $$_  $$ /$$__  $$'
echo '| $$$$_  $$$$| $$$$$$$$| $$| $$      | $$  \ $$| $$ \ $$ \ $$| $$$$$$$$'
echo '| $$$/ \  $$$| $$_____/| $$| $$      | $$  | $$| $$ | $$ | $$| $$_____/'
echo '| $$/   \  $$|  $$$$$$$| $$|  $$$$$$$|  $$$$$$/| $$ | $$ | $$|  $$$$$$$'
echo '|__/     \__/ \_______/|__/ \_______/ \______/ |__/ |__/ |__/ \_______/'
echo '                                                                       '
echo '                                                                       '
echo '                                                                       '
echo '  /$$$$$$            /$$            /$$                                '
echo ' /$$__  $$          | $$           |__/                                '
echo '| $$  \__/  /$$$$$$ | $$ /$$    /$$ /$$ /$$$$$$$                       '
echo '| $$       |____  $$| $$|  $$  /$$/| $$| $$__  $$                      '
echo '| $$        /$$$$$$$| $$ \  $$/$$/ | $$| $$  \ $$                      '
echo '| $$    $$ /$$__  $$| $$  \  $$$/  | $$| $$  | $$                      '
echo '|  $$$$$$/|  $$$$$$$| $$   \  $/   | $$| $$  | $$                      '
echo ' \______/  \_______/|__/    \_/    |__/|__/  |__/                      ' 
        
}



printWelcomCalvin