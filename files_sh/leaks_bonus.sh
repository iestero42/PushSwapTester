# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    leaks_bonus.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/26 12:38:07 by iestero-          #+#    #+#              #
#    Updated: 2023/08/26 15:34:50 by iestero-         ###   ########.fr        #
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
FORMAT_TEXT="%-60s"

path_backup=$(find . -type d -name "backup" -exec dirname {} \;)
path=$(find . -type f -name "*_bonus*" -exec grep -rl "int\tmain" {} \;)
name=$(find . -type f -name "*_bonus*" -exec grep -rl "int\tmain" {} \; | xargs -I{} basename {})

cp $path ./$path_backup/backup/$name

sed -i '1s/^/void leaks(void) {\n\tsystem(\"leaks pipex\")\;\n}\n/' $path

sed -i '/^int\tmain()/{N;s/\n{/\n{\n\tatExit;/}' $path

makeall=$(make re bonus)

leaks_test__function() {
		comand=$1
		echo $comand >> ./.tests/logs/leaks_bonus.log
		$comand >> ./.tests/logs/leaks_bonus.log 2>&1
		echo "--------------------------------------------------------------------" >> ./.tests/logs/leaks_bonus.log
		result=$(cat ./.tests/logs/leaks_bonus.log | grep "0 leaks for 0 total leaked bytes.")
		printf "${SPACES}${WHITE_FONT}${FORMAT_TEXT}${RESET_ALL}" "TEST: $comand: "
		if [ -z "$result" ]; then
			printf "\t\t${RED_FONT}KO${RESET_ALL}\n"
		else
			printf "\t\t${GREEN_FONT}OK${RESET_ALL}\n"
		fi
	}

printf "\n\n*********************************************************************************\n"
printf "*                                                                               *\n"
printf "*                                 ${BLUE_FONT}LEAKS CHECKER${RESET_ALL}                                 *\n"
printf "*                                                                               *\n"
printf "*********************************************************************************\n\n\n"

leaks_test__function "./checker \"\""

leaks_test__function "./checker \"      \""

leaks_test__function "./push_swap 1 2 3 4 | ./checker 1 2 3 4"

leaks_test__function "./push_swap 1 |./checker 1"

leaks_test__function "./push_swap +1 +3 +2 -4 | ./checker +1 +3 +2 -4"

leaks_test__function "./checker 9999999999999 2 21"

leaks_test__function "./checker hola me llamo"

leaks_test__function "./checker \"    4   \""

leaks_test__function "./checker 1 c 2"

leaks_test__function "./push_swap -2147483648 | ./checker -2147483648"


printf "\n\n"
mv ./$path_backup/backup/$name $path