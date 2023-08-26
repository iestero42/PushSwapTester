# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/26 12:27:56 by iestero-          #+#    #+#              #
#    Updated: 2023/08/26 14:19:59 by iestero-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

BLUE_FONT="\e[1;34m"
RED_FONT="\e[1;31m"
RESET_COLOR_FONT="\e[39m"
RESET_ALL="\e[0m"

checker_mac="./checkers/checker_mac"
checker_linux="./checkers/checker_linux"
checker_bonus="./checker"

red_cross="\xE2\x9D\x8C"
tick="\xE2\x9C\x85"

checker=$checker_mac

export checker

rm -f ./.tests/logs/leaks_bonus.log

rm -f ./.tests/logs/leaks.log

printf "\n"
printf "**********************************************************************************\n"
printf "*                                                                                *\n"
printf "*                                 ${BLUE_FONT}TEST PUSH_SWAP${RESET_ALL}                                 *\n"
printf "*                                                                                *\n"
printf "**********************************************************************************\n\n"

makeall=$(make re)
if [ ! -f "push_swap" ]; then
    printf "$red_cross make all"
    exit 1  # Salir del script con un código de salida (puede ser cualquier número)
else
	printf "$tick make all\n"
fi

sleep 2

result=$(ls -R | grep "_bonus")
if [ -n "$result" ]; then
    makebonus=$(make bonus)
	if [ ! -f "checker" ]; then
    	printf "$red_cross make bonus\n"  # Salir del script con un código de salida (puede ser cualquier número)
	else
		printf "$tick make bonus\n"
	fi
fi

sleep 2

printf "\n\n"

bash ./.tests/files_sh/errors_test.sh

sleep 2

bash ./.tests/files_sh/simple_test.sh

sleep 2

bash ./.tests/files_sh/"100_test.sh"

sleep 2

bash ./.tests/files_sh/"500_test.sh"

sleep 2

bash ./.tests/files_sh/leaks.sh

sleep 2

if [ ! -f "checker" ]; then
    exit 1  # Salir del script con un código de salida (puede ser cualquier número)
fi

bash ./.tests/files_sh/bonus_test.sh

sleep 2

bash ./.tests/files_sh/leaks_bonus.sh