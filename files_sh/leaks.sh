# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    leaks.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/26 11:48:04 by iestero-          #+#    #+#              #
#    Updated: 2023/08/26 15:16:23 by iestero-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#Terminar en 42
#metodo mas general para todos
#meter la funcion leaks en el fichero 
	#sed -i '1s/^/void leaks(void) {\n\tsystem(\"leaks pipex\")\;\n}\n/' main.c
#meter el atExit al main faltaria cambiar la partedel main
	#sed -i '/^int\tmain()/{N;s/\n{/\n{\n\tatExit;/}' main.c

 
YELLOW_BACK="\e[43m"
BLUE_FONT="\e[1;34m"
GREEN_FONT="\e[0;32m"
WHITE_FONT="\e[1;37m"
RED_FONT="\e[1;31m"
RESET_COLOR_FONT="\e[39m"
RESET_ALL="\e[0m"

SPACES="  "
FORMAT_TEXT="%-50s"

path_backup=$(find . -type d -name "backup" -exec dirname {} \;)
path=$(grep -rl "int\tmain" ./* | grep -v "_bonus")
name=$(grep -rl "int\tmain" ./* | grep -v "_bonus" | xargs -I{} basename {})

cp $path ./$path_backup/backup/$name

sed -i '1s/^/void leaks(void) {\n\tsystem(\"leaks pipex\")\;\n}\n/' $path

sed -i '/^int\tmain()/{N;s/\n{/\n{\n\tatExit;/}' $path

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
mv ./$path_backup/backup/$name $path


