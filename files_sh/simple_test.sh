# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    simple_test.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/19 20:38:01 by marvin            #+#    #+#              #
#    Updated: 2023/03/29 16:22:42 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

YELLOW="\e[1;33m"
BLUE_FONT="\e[1;34m"
GREEN_FONT="\e[0;32m"
WHITE_FONT="\e[1;37m"
RED_FONT="\e[1;31m"
RESET_COLOR_FONT="\e[39m"
RESET_ALL="\e[0m"

SPACES="  "
FORMAT_TEXT="%-30s"

checker_mac="./checkers/checker_mac"
checker_linux="./checkers/checker_linux"
checker_bonus="./checker"

checker=$checker_bonus

simple_test__function() {
		comand=$1
		lines=$(./push_swap $1 | wc -l)
		result=$(./push_swap $1 | $checker $1)
		printf "${SPACES}${WHITE_FONT}${FORMAT_TEXT}${RESET_ALL}" "TEST: ./push_swap $comand: "
		if [ "$result" = "OK" ]; then
			printf "\t${GREEN_FONT}OK${RESET_ALL}"
		else
			printf "\t${RED_FONT}KO${RESET_ALL}"
		fi
		printf "\t${BLUE_FONT}INTRUCTIONS:${RESET_ALL}${YELLOW}\t$lines${RESET_ALL}\n"
	}

echo ""
printf "*********************************************************************************\n"
printf "***************************** ${BLUE_FONT}SIMPLE_TESTS PUSH_SWAP${RESET_ALL} *****************************\n"
printf "*********************************************************************************\n\n\n"



printf "CHECKER: $checker\n\n"

printf "\n${GREEN_FONT}3_NUMBERS\n${RESET_ALL}\n"

	simple_test__function "1 2 3"
	
	simple_test__function "3 2 1"

	simple_test__function "2 0 3"
	
	simple_test__function "2 0 3"

	simple_test__function "2 1 3"

printf "\n${GREEN_FONT}5_NUMBERS\n${RESET_ALL}\n"

	simple_test__function "1 2 3 4 5"

    simple_test__function "1 2 3 5 4"

    simple_test__function "1 2 4 3 5"

    simple_test__function "1 2 4 5 3"

    simple_test__function "1 2 5 3 4"

    simple_test__function "1 2 5 4 3"

    simple_test__function "1 3 2 4 5"

    simple_test__function "1 3 2 5 4"

    simple_test__function "1 3 4 2 5"

    simple_test__function "1 3 4 5 2"

    simple_test__function "1 3 5 2 4"

    simple_test__function "1 3 5 4 2"

    simple_test__function "1 4 2 3 5"

    simple_test__function "1 4 2 5 3"

    simple_test__function "1 4 3 2 5"

    simple_test__function "1 4 3 5 2"

    simple_test__function "1 4 5 2 3"

    simple_test__function "1 4 5 3 2"

    simple_test__function "1 5 2 3 4"

    simple_test__function "1 5 2 4 3"

    simple_test__function "1 5 3 2 4"

    simple_test__function "1 5 3 4 2"

    simple_test__function "1 5 4 2 3"

    simple_test__function "1 5 4 3 2"

    simple_test__function "2 1 3 4 5"

    simple_test__function "2 1 3 5 4"

    simple_test__function "2 1 4 3 5"

    simple_test__function "2 1 4 5 3"

    simple_test__function "2 1 5 3 4"

    simple_test__function "2 1 5 4 3"

    simple_test__function "2 3 1 4 5"

    simple_test__function "2 3 1 5 4"

    simple_test__function "2 3 4 1 5"

    simple_test__function "2 3 4 5 1"

    simple_test__function "2 3 5 1 4"

    simple_test__function "2 3 5 4 1"

    simple_test__function "2 4 1 3 5"

    simple_test__function "2 4 1 5 3"

    simple_test__function "2 4 3 1 5"

    simple_test__function "2 4 3 5 1"

    simple_test__function "2 4 5 1 3"

    simple_test__function "2 4 5 3 1"

    simple_test__function "2 5 1 3 4"

    simple_test__function "2 5 1 4 3"

    simple_test__function "2 5 3 1 4"

    simple_test__function "2 5 3 4 1"

    simple_test__function "2 5 4 1 3"

    simple_test__function "2 5 4 3 1"

    simple_test__function "3 1 2 4 5"

    simple_test__function "3 1 2 5 4"

    simple_test__function "3 1 4 2 5"

    simple_test__function "3 1 4 5 2"

    simple_test__function "3 1 5 2 4"

    simple_test__function "3 1 5 4 2"

    simple_test__function "3 2 1 4 5"

    simple_test__function "3 2 1 5 4"

    simple_test__function "3 2 4 1 5"

    simple_test__function "3 2 4 5 1"

    simple_test__function "3 2 5 1 4"

    simple_test__function "3 2 5 4 1"

    simple_test__function "3 4 1 2 5"

    simple_test__function "3 4 1 5 2"

    simple_test__function "3 4 2 1 5"

    simple_test__function "3 4 2 5 1"

    simple_test__function "3 4 5 1 2"

    simple_test__function "3 4 5 2 1"

    simple_test__function "3 5 1 2 4"

    simple_test__function "3 5 1 4 2"

    simple_test__function "3 5 2 1 4"

    simple_test__function "3 5 2 4 1"

    simple_test__function "3 5 4 1 2"

    simple_test__function "3 5 4 2 1"

    simple_test__function "4 1 2 3 5"

    simple_test__function "4 1 2 5 3"

    simple_test__function "4 1 3 2 5"

    simple_test__function "4 1 3 5 2"

    simple_test__function "4 1 5 2 3"

    simple_test__function "4 1 5 3 2"

    simple_test__function "4 2 1 3 5"

    simple_test__function "4 2 1 5 3"

    simple_test__function "4 2 3 1 5"

    simple_test__function "4 2 3 5 1"

    simple_test__function "4 2 5 1 3"

    simple_test__function "4 2 5 3 1"

    simple_test__function "4 3 1 2 5"

    simple_test__function "4 3 1 5 2"

    simple_test__function "4 3 2 1 5"

    simple_test__function "4 3 2 5 1"

    simple_test__function "4 3 5 1 2"

    simple_test__function "4 3 5 2 1"

    simple_test__function "4 5 1 2 3"

    simple_test__function "4 5 1 3 2"

    simple_test__function "4 5 2 1 3"

    simple_test__function "4 5 2 3 1"

    simple_test__function "4 5 3 1 2"

    simple_test__function "4 5 3 2 1"

    simple_test__function "5 1 2 3 4"

    simple_test__function "5 1 2 4 3"

    simple_test__function "5 1 3 2 4"

    simple_test__function "5 1 3 4 2"

    simple_test__function "5 1 4 2 3"

    simple_test__function "5 1 4 3 2"

    simple_test__function "5 2 1 3 4"

    simple_test__function "5 2 1 4 3"

    simple_test__function "5 2 3 1 4"

    simple_test__function "5 2 3 4 1"

    simple_test__function "5 2 4 1 3"

    simple_test__function "5 2 4 3 1"

    simple_test__function "5 3 1 2 4"

    simple_test__function "5 3 1 4 2"

    simple_test__function "5 3 2 1 4"

    simple_test__function "5 3 2 4 1"

    simple_test__function "5 3 4 1 2"

    simple_test__function "5 3 4 2 1"

    simple_test__function "5 4 1 2 3"

    simple_test__function "5 4 1 3 2"

    simple_test__function "5 4 2 1 3"

    simple_test__function "5 4 2 3 1"

    simple_test__function "5 4 3 1 2"

    simple_test__function "5 4 3 2 1"

printf "\n\n"