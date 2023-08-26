# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    leaks.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/26 11:48:04 by iestero-          #+#    #+#              #
#    Updated: 2023/08/26 13:43:31 by iestero-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

YELLOW_BACK="\e[43m"
BLUE_FONT="\e[1;34m"
GREEN_FONT="\e[0;32m"
WHITE_FONT="\e[1;37m"
RED_FONT="\e[1;31m"
RESET_COLOR_FONT="\e[39m"
RESET_ALL="\e[0m"

SPACES="  "
FORMAT_TEXT="%-50s"


cp ./src/main/push_swap.c ./.tests/backup/push_swap.c

cp ./.tests/files_c/push_swap_leaks.c ./src/main/push_swap.c

leaks_test__function() {
		makeall=$(make all)
		comand=$1
		echo $comand >> ./.tests/logs/leaks.log
		$comand >> ./.tests/logs/leaks.log 2>&1
		$comand >> temp.log 2>&1
		echo "--------------------------------------------------------------------" >> ./.tests/logs/leaks.log
		result=$(cat temp.log | grep "0 leaks for 0 total leaked bytes.")
		rm temp.log
		printf "${SPACES}${WHITE_FONT}${FORMAT_TEXT}${RESET_ALL}" "TEST: $comand: "
		if [ -z "$result" ]; then
			printf "\t${RED_FONT}KO${RESET_ALL}\n"
		else
			printf "\t${GREEN_FONT}OK${RESET_ALL}\n"
		fi
	}

printf "\n\n*********************************************************************************\n"
printf "*                                                                               *\n"
printf "*                                ${BLUE_FONT}LEAKS PUSH_SWAP${RESET_ALL}                                *\n"
printf "*                                                                               *\n"
printf "*********************************************************************************\n\n\n"

leaks_test__function "./push_swap \"\""

leaks_test__function "./push_swap \"      \""

leaks_test__function "./push_swap 1 2 3 4"

leaks_test__function "./push_swap 1"

leaks_test__function "./push_swap +1 +3 +2 -4"

leaks_test__function "./push_swap 9999999999999 2 21"

leaks_test__function "./push_swap hola me llamo"

leaks_test__function "./push_swap \"    4   \""

leaks_test__function "./push_swap 1 c 2"

leaks_test__function "./push_swap -2147483648"

leaks_test__function "./push_swap 1 2 3 4 1"


printf "\n\n"
mv ./.tests/backup/push_swap.c ./src/main/push_swap.c


