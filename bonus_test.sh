# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bonus_test.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/29 15:08:25 by marvin            #+#    #+#              #
#    Updated: 2023/08/14 12:43:28 by iestero-         ###   ########.fr        #
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
FORMAT_TEXT="%-50s"

error_test__function() {
		comand=$1
		$comand 2> error.log
		result=$(cat error.log)
		rm error.log
		printf "${SPACES}${WHITE_FONT}${FORMAT_TEXT}${RESET_ALL}" "TEST: $comand: "
		printf "${RED_FONT}$result${RESET_ALL}"
		if [ "$result" = "Error" ] || [ "$result" = "" ]; then
			printf "\t${GREEN_FONT}OK${RESET_ALL}\n"
		else
			printf "${RED_FONT}KO${RESET_ALL}\n"
		fi
	}

echo ""
printf "*********************************************************************************\n"
printf "***************************** ${BLUE_FONT}BONUS_TEST PUSH_SWAP${RESET_ALL} *****************************\n"
printf "*********************************************************************************\n\n\n"

printf "${GREEN_FONT}EMPTY INPUT${RESET_ALL}\n\n"

	error_test__function "./checker"

printf "\n${GREEN_FONT}BAD INPUT\n${RESET_ALL}\n"

	error_test__function "./checker 1 c 2"
	
	error_test__function "./checker ! 2 3"

	error_test__function "./checker \" \""

	error_test__function "./checker \"       \""

	error_test__function "./checker \"1 2 3\" f"
	
	error_test__function "./checker \"1 2 cero\" f"

	error_test__function "./checker 9999999999 1"

	error_test__function "./checker hola 1 me llamo 42"


printf "\n${GREEN_FONT}BAD LIST\n${RESET_ALL}\n"

	error_test__function "./checker 1 1"

	error_test__function "./checker \"1 2 3 4\" 1 2 3 4"

	error_test__function "./checker 1 2 3 4 32 \"32\""
	
	error_test__function "./checker 1 2 3 4 5 2"

	error_test__function "./checker 1 23 44343 0 0"

	error_test__function "./checker \"1 2 3 4 5\" \"1 4\""

	error_test__function "./checker \"1 2 3 4 5\" \"1 4\""

printf "\n"