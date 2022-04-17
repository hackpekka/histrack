#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')" YELLOW="$(printf '\033[1;33m')"

banner() {
clear
	cat <<- EOF
		${RED}
██╗  ██╗██╗███████╗████████╗██████╗  █████╗  ██████╗██╗  ██╗
██║  ██║██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝
███████║██║███████╗   ██║   ██████╔╝███████║██║     █████╔╝ 
██╔══██║██║╚════██║   ██║   ██╔══██╗██╔══██║██║     ██╔═██╗ 
██║  ██║██║███████║   ██║   ██║  ██║██║  ██║╚██████╗██║  ██╗
╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
                                                            
      ${RED}Version : ${WHITE}1.2

		  ${RED}<${WHITE}-${RED}>${RED} Created HackPekka (${WHITE}htr-tech${RED})
	EOF
sleep 1
}

menu() {
banner
printf "\e[0m\n"
printf "\e[0m\e[1;31m  <\e[0m\e[1;37m1\e[0m\e[1;31m>\e[0m\033[31m My IP\e[0m\n"
sleep 0.1
printf "\e[0m\e[1;31m  <\e[0m\e[1;37m2\e[0m\e[1;31m>\e[0m\\033[31m Track Ip\e[0m\n"
sleep 0.1
printf "\e[0m\e[1;31m  <\e[0m\e[1;37m0\e[0m\e[1;31m>\e[0m\\033[31m Exit\e[0m\n"
sleep 0.1
printf "\e[0m\n"
read -p $'  \e[1;31m<\e[0m\e[1;37m-\e[0m\e[1;31m>\e[0m\033[37m Select \033[33m\033[31m>> \033[33m\e[1;93m\en' option

if [[ $option == 1 || $option == 01 ]]; then
myipaddr
elif [[ $option == 2 || $option == 02 ]]; then
useripaddr
elif [[ $option == 0 || $option == 00 ]]; then
sleep 1
printf "\e[0m\n"
printf "\e[0m\n"
exit 1

else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}
myipaddr() {
clear
myipaddripapico=$(curl -s "https://ipapi.co//json" -L)
myipaddripapicom=$(curl -s "http://ip-api.com/json/" -L)
myip=$(echo $myipaddripapico | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
mycity=$(echo $myipaddripapico | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myregion=$(echo $myipaddripapico | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycountry=$(echo $myipaddripapico | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylat=$(echo $myipaddripapicom | grep -Po '(?<="lat":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylon=$(echo $myipaddripapicom | grep -Po '(?<="lon":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mytime=$(echo $myipaddripapicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mypostal=$(echo $myipaddripapicom | grep -Po '(?<="zip":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myisp=$(echo $myipaddripapico | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
myasn=$(echo $myipaddripapico | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycountrycode=$(echo $myipaddripapico | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycurrency=$(echo $myipaddripapico | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mylanguage=$(echo $myipaddripapico | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
mycalling=$(echo $myipaddripapico | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

banner
printf "\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Ip Address    \e[0m\e[1;96m:\e[0m\e[1;92m   $myip\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  City          \e[0m\e[1;96m:\e[0m\e[1;92m   $mycity\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Region        \e[0m\e[1;96m:\e[0m\e[1;92m   $myregion\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Country       \e[0m\e[1;96m:\e[0m\e[1;92m   $mycountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Latitude      \e[0m\e[1;96m:\e[0m\e[1;92m    $mylat\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Longitude     \e[0m\e[1;96m:\e[0m\e[1;92m    $mylon\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Time Zone     \e[0m\e[1;96m:\e[0m\e[1;92m    $mytime\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Postal Code   \e[0m\e[1;96m:\e[0m\e[1;92m    $mypostal\e[0m\n"
printf "\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  ISP           \e[0m\e[1;96m:\e[0m\e[1;92m   $myisp\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  ASN           \e[0m\e[1;96m:\e[0m\e[1;92m   $myasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Country Code  \e[0m\e[1;96m:\e[0m\e[1;92m   $mycountrycode\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Currency      \e[0m\e[1;96m:\e[0m\e[1;92m   $mycurrency\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Languages     \e[0m\e[1;96m:\e[0m\e[1;92m   $mylanguage\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Calling Code  \e[0m\e[1;96m:\e[0m\e[1;92m   $mycalling\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  GOOGLE Maps   \e[0m\e[1;96m:\e[0m\e[1;94m  https://maps.google.com/?q=$mylat,$mylon\e[0m\n"
sleep 5
printf "\e[0m\n"
printf "  ${RED}<${WHITE}1${RED}> Main Menu"
printf "  ${RED}<${WHITE}2${RED}> Exit"
printf "\e[0m\n"
read -p $'  \e[1;31m>>\e[0m\e[1;96m  \en' mainorexit1

if [[ $mainorexit1 == 1 || $mainorexit1 == 01 ]]; then
menu
elif [[ $mainorexit1 == 2 || $mainorexit1 == 02 ]]; then
printf "\e[0m\n"
printf "\e[0m\n"
exit 1

else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"

menu
fi

}
zero() {
clear
printf "\e[0m\n"
sleep 0.1
printf "${YELLOW} Enter Code to Unlock this Tool!"
printf "\e[0m\n"
printf "${RED}"
sleep 0.1
printf "\e[0m\n"
read -p ${YELLOW}'  >>'${BLACK}${BLACKBG} zero
if [[ $zero == iwbh2 || $zero == sudo-s ]]; then
menu
else
printf "${RED}    INVALID CODE [X]"
printf "\e[0m\n"
sleep 1
zerohelp
sleep 13
zero
fi
}
zerohelp() {
cat <<- EOF

${YELLOW}    Problem Here?

${REDBG}${WHITE}If you dont know code do this:${RESETBG}

${YELLOW}1. Join our Telegram: ${RED}https://t.me/+sX0qdcVcbEE1Y2I0

${YELLOW}2. Find Code in Telegram
EOF
}
useripaddr() {
banner
printf "\e[0m\n"
read -p $'  \e[1;31m<\e[0m\e[1;37m-\e[0m\e[1;31m>\e[0m\033[31m Input IP Address \e[0m\033[37m: \e[0m\e[1;93m\en' useripaddress

ipaddripapico=$(curl -s "https://ipapi.co/$useripaddress/json" -L)
ipaddripapicom=$(curl -s "http://ip-api.com/json/$useripaddress" -L)
userip=$(echo $ipaddripapico | grep -Po '(?<="ip":)[^,]*' | tr -d '[]"')
usercity=$(echo $ipaddripapico | grep -Po '(?<="city":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
useregion=$(echo $ipaddripapico | grep -Po '(?<="region":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercountry=$(echo $ipaddripapico | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlat=$(echo $ipaddripapicom | grep -Po '(?<="lat":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlon=$(echo $ipaddripapicom | grep -Po '(?<="lon":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usertime=$(echo $ipaddripapicom | grep -Po '(?<="timezone":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userpostal=$(echo $ipaddripapicom | grep -Po '(?<="zip":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userisp=$(echo $ipaddripapico | grep -Po '(?<="org":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userasn=$(echo $ipaddripapico | grep -Po '(?<="asn":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercountrycode=$(echo $ipaddripapico | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercurrency=$(echo $ipaddripapico | grep -Po '(?<="currency":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
userlanguage=$(echo $ipaddripapico | grep -Po '(?<="languages":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
usercalling=$(echo $ipaddripapico | grep -Po '(?<="country_calling_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

banner
printf "\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Ip Address    \e[0m\e[1;96m:\e[0m\e[1;92m   $userip\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  City          \e[0m\e[1;96m:\e[0m\e[1;92m   $usercity\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Region        \e[0m\e[1;96m:\e[0m\e[1;92m   $useregion\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Country       \e[0m\e[1;96m:\e[0m\e[1;92m   $usercountry\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Latitude      \e[0m\e[1;96m:\e[0m\e[1;92m    $userlat\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Longitude     \e[0m\e[1;96m:\e[0m\e[1;92m    $userlon\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Time Zone     \e[0m\e[1;96m:\e[0m\e[1;92m    $usertime\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Postal Code   \e[0m\e[1;96m:\e[0m\e[1;92m    $userpostal\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  ISP           \e[0m\e[1;96m:\e[0m\e[1;92m   $userisp\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  ASN           \e[0m\e[1;96m:\e[0m\e[1;92m   $userasn\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  Country Code  \e[0m\e[1;96m:\e[0m\e[1;92m   $usercountrycode\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Currency      \e[0m\e[1;96m:\e[0m\e[1;92m   $usercurrency\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Languages     \e[0m\e[1;96m:\e[0m\e[1;92m   $userlanguage\e[0m\n"
sleep 0.1
printf "  \e[0m\033[31m  Calling Code  \e[0m\e[1;96m:\e[0m\e[1;92m   $usercalling\e[0m\n"
printf "\e[0m\n"
printf "  \e[0m\033[31m  GOOGLE Maps   \e[0m\e[1;96m:\e[0m\e[1;94m  https://maps.google.com/?q=$userlat,$userlon\e[0m\n"
sleep 5
printf "\e[0m\n"
printf "  ${RED}<${WHITE}1${RED}> Main Menu"
printf "  ${RED}<${WHITE}2${RED}> Exit"
printf "\e[0m\n"
read -p $'  \e[1;31m>>\e[0m\e[1;96m  \en' mainorexit2

if [[ $mainorexit2 == 1 || $mainorexit2 == 01 ]]; then
banner
menu
elif [[ $mainorexit2 == 2 || $mainorexit2 == 02 ]]; then
printf "\e[0m\n"
printf "\e[0m\n"
exit 1

else
printf " \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

zero
