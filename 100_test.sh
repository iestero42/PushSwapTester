# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    100_test.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iestero- <iestero-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/20 12:26:20 by marvin            #+#    #+#              #
#    Updated: 2023/08/14 12:25:25 by iestero-         ###   ########.fr        #
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

worst_case=0
best_case=2147483646
average_case=0
number_tests=0
total_ins=0

checker=$checker_bonus

simple_test__function() {
		comand=$1
		lines=$(./push_swap $1 | wc -l)
		if [ "$lines" -gt "$worst_case" ]; then
   			worst_case=$lines
		fi
		if [ "$best_case" -gt "$lines" ]; then
   			best_case=$lines
		fi
		total_ins=$((total_ins + lines))
		number_tests=$((number_tests + 1))
		result=$(./push_swap $1 | $checker $1)
		printf "${SPACES}${WHITE_FONT}${FORMAT_TEXT}${RESET_ALL}" "TEST: ./push_swap 100 random numbers: "
		if [ "$result" = "OK" ]; then
			printf "\t${GREEN_FONT}OK${RESET_ALL}"
		else
			printf "\t${RED_FONT}KO${RESET_ALL}"
		fi
		printf "\t${BLUE_FONT}INTRUCTIONS:${RESET_ALL}${YELLOW}\t$lines${RESET_ALL}\n"
	}

echo ""
printf "*********************************************************************************\n"
printf "***************************** ${BLUE_FONT}100_TEST PUSH_SWAP${RESET_ALL} *****************************\n"
printf "*********************************************************************************\n\n\n"



printf "CHECKER: $checker\n\n"


printf "\n${GREEN_FONT}100_NUMBERS\n${RESET_ALL}\n"

simple_test__function "63 73 105 184 52 +176 53 150 29 143 35 10 46 27 154 78 191 42 2 87 193 183 138 82 48 180 28 148 101 178 172 66 39 68 129 123 11 92 139 55 190 72 84 175 3 124 93 145 19 126 159 7 103 158 199 33 189 128 164 16 49 142 144 56 174 109 61 195 177 6 54 120 97 89 117 200 88 8 141 115 171 69 104 99 113 95 81 58 122 31 65 135 32 94 12 91 165 25 36 153"

simple_test__function "75 74 35 30 +24 27 67 52 14 99 46 32 45 87 26 81 77 41 60 68 49 38 1 76 92 64 86 63 15 19 65 66 23 6 80 98 22 48 51 12 2 95 37 94 16 88 40 42 82 8 90 47 85 53 91 69 18 7 93 43 34 70 96 59 25 97 100 4 72 58 73 33 55 84 79 83 56 28 5 39 62 57 36 9"

simple_test__function "3 54 85 16 87 90 9 20 62 88 63 98 49 92 83 70 37 32 39 89 36 59 78 77 15 1 35 86 48 41 52 11 94 29 95 2 81 69 64 71 10 68 91 8 47 18 33 12 67 21 80 23 26 73 84 43 61 24 34 28 19 6 96 42 25 14 13 40 79 50 65 44 99 22 53 55 58 75 30 93 56 31 66 17 60 51 38 5 0 7 74 57 4 27 46 45 72 82 97 76"

simple_test__function "42 21 76 30 89 32 35 +82 93 52 7 70 33 8 43 37 28 15 51 34 4 23 22 49 88 59 74 53 31 62 64 67 84 39 65 40 75 26 69 60 47 14 9 16 83 66 13 36 55 54 81 91 85 12 63 94 25 96 99 18 29 71 6 97 72 58 92 79 46 41 48 98 45 68 87 86 24 10 44 95 57 0 3 50 61 20 38 1 11 90 5 78 73 80 19 2 77 17 56 27"

simple_test__function "91 26 92 78 99 66 61 68 7 65 88 5 44 15 30 9 64 18 77 20 23 70 81 40 58 21 31 25 16 3 98 93 39 22 97 11 10 37 76 47 62 41 96 19 50 52 55 72 27 90 53 28 63 14 57 48 35 2 4 71 54 1 24 43 42 69 79 94 73 0 51 82 13 84 87 6 17 59 85 60 95 46 89 80 67 34 29 36 86 33 56 75 74 12 32 83 45 38 49 8"

simple_test__function "86 59 20 49 34 55 0 77 46 44 41 24 69 6 43 68 33 82 39 48 61 94 99 92 25 42 95 72 53 54 27 17 2 23 96 45 14 83 12 9 90 79 37 11 36 1 50 7 16 29 62 67 60 10 63 40 21 22 84 98 64 13 51 58 47 88 5 70 4 97 18 30 35 28 89 31 8 91 52 81 66 87 32 78 19 76 73 26 15 56 38 75 65 71 80 93 3 57 74 85"

simple_test__function "81 10 7 88 77 35 9 34 48 5 14 27 60 65 58 8 61 38 19 20 82 96 62 11 49 56 45 86 3 68 2 95 16 28 33 26 87 29 6 89 50 79 64 85 30 76 17 74 71 24 13 54 99 36 73 98 63 69 78 91 1 55 72 83 84 57 18 47 32 53 75 44 42 39 22 67 4 41 66 31 80 37 46 59 92 97 90 23 40 93 70 51 52 25 15 0 21 94 43 12"

simple_test__function "43 24 25 87 67 16 54 61 50 91 8 73 7 21 0 33 38 31 92 34 11 94 55 84 69 90 35 81 22 79 76 29 18 59 41 78 68 74 83 96 1 6 60 77 2 88 89 62 23 52 37 58 3 80 49 47 44 27 72 9 46 71 36 85 42 51 64 97 95 28 45 98 75 56 57 30 20 5 26 99 48 17 86 15 12 93 82 40 14 39 4 53 10 19 32 65 70 63 13 66"

simple_test__function "18 89 92 11 22 +64 90 65 51 94 85 72 39 34 41 91 38 61 80 79 17 3 37 88 50 43 54 13 96 31 97 4 83 71 66 73 12 70 93 10 49 20 35 14 69 23 82 25 28 75 86 45 0 63 26 1 36 30 21 8 98 44 27 16 15 42 81 52 67 46 24 55 57 60 77 32 95 58 33 68 19 62 53 40 7 2 9 76 59 6 29 48 47 74 84 99 78 5 56 87"

simple_test__function "52 17 66 23 32 45 78 83 76 9 26 79 56 37 38 11 1 7 80 29 67 74 63 21 86 20 34 0 13 46 51 44 47 24 5 6 68 97 82 48 94 35 92 89 42 31 72 54 91 81 2 87 96 14 19 12 73 90 15 75 36 65 50 71 16 93 62 3 60 57 10 40 85 22 59 84 49 98 55 64 77 41 58 88 69 70 43 4 33 18 39 61 30 99 28 25 95 8 53 27"

simple_test__function "90 97 36 19 94 8 7 34 73 44 59 38 93 16 47 49 52 99 69 24 87 50 25 60 11 54 45 32 1 68 51 21 40 39 66 76 91 70 48 79 10 81 84 3 14 56 82 57 92 43 86 77 64 31 26 33 83 30 53 72 71 98 9 29 80 42 35 46 5 88 23 89 75 96 63 58 65 4 62 85 2 41 12 27 6 61 15 74 17 20 67 78 37 55 18 28 22 13 0 95"

simple_test__function "41 92 54 0 47 58 17 35 8 87 2 75 70 77 16 74 97 14 53 24 39 18 73 27 86 29 32 79 90 49 4 67 30 5 40 34 25 12 48 31 1 20 19 46 85 56 71 50 28 59 61 64 81 36 99 62 37 72 23 66 57 44 11 6 13 80 63 10 33 52 51 78 88 82 9 60 91 22 93 96 15 26 68 3 94 69 55 98 89 76 43 38 45 95 42 65 84 83 21 7"

simple_test__function "91 8 47 18 33 12 67 21 80 23 26 73 84 43 61 24 34 28 19 6 96 42 25 14 13 40 79 50 65 44 99 22 53 55 58 75 30 93 56 31 66 17 60 51 38 5 0 7 74 57 4 27 46 45 72 82 97 76 3 54 85 16 87 90 9 20 62 88 63 98 49 92 83 70 37 32 39 89 36 59 78 77 15 1 35 86 48 41 52 11 94 29 95 2 81 69 64 71 10 68"

simple_test__function "71 85 51 0 97 38 95 92 45 34 75 57 94 84 5 90 99 17 22 15 76 93 18 78 39 68 53 74 19 96 65 6 63 60 13 2 43 88 25 62 87 52 58 67 80 44 61 91 72 73 46 7 36 21 42 64 33 31 28 98 11 56 30 55 20 69 26 35 48 81 86 79 12 29 82 59 40 41 14 4 10 83 32 1 70 77 66 24 89 23 37 3 16 49 54 47 50 27 8 9"

simple_test__function "12 89 58 56 53 6 36 81 +18 55 80 45 94 51 60 73 37 54 84 65 66 39 0 29 14 35 57 26 95 24 21 91 4 49 23 48 13 62 19 28 41 74 79 72 5 22 75 52 33 34 7 96 3 76 25 63 70 59 17 82 16 30 9 42 47 40 43 20 1 2 64 93 78 99 44 90 31 88 85 38 27 68 50 87 77 83 92 10 15 8 69 86 11 97 98 71 32 61 46 67"

simple_test__function "93 88 95 34 17 92 6 5 32 71 42 57 36 91 14 45 47 50 97 67 22 85 48 23 58 9 52 43 30 66 49 19 38 37 64 74 89 68 46 77 8 79 82 1 12 99 54 80 55 90 41 84 75 62 29 24 31 98 81 28 51 70 69 96 7 27 78 40 33 44 3 86 21 87 73 94 61 56 63 2 60 83 0 39 10 25 4 59 13 72 15 18 65 76 35 53 16 26 20 11"

simple_test__function "39 9 28 27 54 93 64 79 58 36 67 69 72 2 89 44 70 45 80 31 74 65 52 19 14 21 88 71 18 41 60 59 86 96 90 17 68 99 30 23 34 76 11 77 63 97 84 51 46 53 50 73 92 91 29 0 15 49 3 62 5 8 55 66 25 43 6 16 95 10 1 83 78 85 24 7 82 22 61 32 47 26 81 4 35 94 37 40 87 98 57 12 75 38 13 48 42 33 20 56"

simple_test__function "86 55 53 50 3 33 78 15 52 77 42 91 48 57 70 34 51 81 62 63 36 26 11 32 54 23 92 21 18 99 88 1 46 20 45 10 59 16 25 38 71 76 69 2 19 72 49 30 31 4 93 0 73 22 60 67 56 97 14 79 13 27 6 39 44 37 98 40 17 61 90 75 96 41 87 28 85 82 35 24 65 47 84 74 80 89 7 12 5 66 83 8 94 95 68 29 58 43 64 9"

simple_test__function "49 6 15 28 61 66 59 9 62 39 20 21 83 97 63 12 50 57 46 87 4 69 3 96 17 29 34 27 88 30 7 90 51 80 65 86 31 77 18 75 72 25 14 55 37 74 99 64 70 79 92 2 56 73 84 85 58 19 48 33 54 76 45 43 40 23 68 5 42 67 32 81 38 47 60 93 98 91 24 41 94 71 52 53 26 16 1 22 95 44 13 82 11 8 89 78 36 10 35 0"

simple_test__function "15 16 78 92 58 7 45 99 52 41 82 64 91 12 97 24 29 22 83 25 2 85 46 75 60 81 26 72 13 70 67 20 9 50 95 32 69 94 59 65 74 87 51 68 98 79 80 53 14 43 28 49 71 40 38 35 18 63 0 37 62 27 76 33 42 55 88 93 86 19 36 89 66 47 48 21 11 17 90 39 8 77 6 3 84 73 31 96 5 30 44 1 10 23 56 61 54 4 57 34"

simple_test__function "6 91 18 23 16 77 94 19 79 40 69 54 75 20 97 66 7 64 61 14 3 44 89 26 63 88 53 59 68 81 45 62 92 73 74 47 8 37 22 43 65 34 32 29 99 12 57 31 56 21 70 27 36 49 82 87 80 13 30 83 60 41 42 15 5 11 84 33 2 71 0 78 67 25 90 24 38 4 17 50 55 48 51 28 9 10 72 86 52 1 98 39 96 93 46 35 76 58 95 85"

simple_test__function "3 54 85 16 87 90 9 20 62 88 63 98 49 92 83 70 37 32 39 89 36 59 78 77 15 1 35 86 48 41 52 11 94 29 95 2 81 69 64 71 10 68 91 8 47 18 33 12 67 21 80 23 26 73 84 43 61 24 34 28 19 6 96 42 25 14 13 40 79 50 65 44 99 22 53 55 58 75 30 93 56 31 66 17 60 51 38 5 0 7 74 57 4 27 46 45 72 82 97 76"

simple_test__function "1 36 30 21 8 98 44 27 16 15 42 81 52 67 46 24 55 57 60 77 32 95 58 33 68 19 62 53 40 7 2 9 76 59 6 29 48 47 74 84 99 78 5 56 87 18 89 92 11 22 64 90 65 51 94 85 72 39 34 41 91 38 61 80 79 17 3 37 88 50 43 54 13 96 31 97 4 83 71 66 73 12 70 93 10 49 20 35 14 69 23 82 25 28 75 86 45 0 63 26"

simple_test__function "17 12 19 86 69 16 39 58 57 84 94 88 15 66 97 28 99 21 32 74 9 75 61 95 82 49 44 51 48 71 90 89 27 13 47 98 1 60 3 6 53 64 23 41 4 14 93 8 81 76 83 22 5 80 20 59 30 45 24 79 2 33 92 35 38 85 96 55 10 73 36 11 46 40 31 18 54 37 7 26 25 52 91 62 77 56 34 65 67 70 0 87 42 68 43 78 29 72 63 50"

simple_test__function "12 63 94 25 96 99 18 29 71 6 97 72 58 92 79 46 41 48 98 45 68 87 86 24 10 44 95 57 0 3 50 61 20 38 1 11 90 5 78 73 80 19 2 77 17 56 27 42 21 76 30 89 32 35 82 93 52 7 70 33 8 43 37 28 15 51 34 4 23 22 49 88 59 74 53 31 62 64 67 84 39 65 40 75 26 69 60 47 14 9 16 83 66 13 36 55 54 81 91 85"

simple_test__function "98 20 31 73 8 99 74 60 94 81 48 43 50 47 70 89 88 26 12 46 97 0 59 2 5 52 63 22 40 3 13 92 7 80 75 82 21 4 79 19 58 29 44 23 78 1 32 91 34 37 84 95 54 9 72 35 10 45 39 30 17 53 36 6 25 24 51 90 61 76 55 33 64 66 69 86 41 67 42 77 28 71 62 49 16 11 18 85 68 15 38 57 56 83 93 87 14 65 96 27"

simple_test__function "27 46 45 72 82 97 76 3 54 85 16 87 90 9 20 62 88 63 98 49 92 83 70 37 32 39 89 36 59 78 77 15 1 35 86 48 41 52 11 94 29 95 2 81 69 64 71 10 68 91 8 47 18 33 12 67 21 80 23 26 73 84 43 61 24 34 28 19 6 96 42 25 14 13 40 79 50 65 44 99 22 53 55 58 75 30 93 56 31 66 17 60 51 38 5 0 7 74 57 4"

simple_test__function "8 28 79 41 34 45 4 87 22 88 74 95 62 57 64 3 61 84 1 40 11 26 5 60 14 73 16 19 66 77 36 54 17 27 21 12 94 89 96 35 18 93 7 6 33 72 43 58 37 92 15 46 48 51 98 68 23 86 49 24 59 10 53 44 31 0 67 50 20 39 38 65 75 90 69 47 78 9 80 83 2 13 55 81 56 91 42 85 76 63 30 25 32 99 82 29 52 71 70 97"

simple_test__function "75 36 65 50 71 16 93 62 3 60 57 10 40 85 22 59 84 49 98 55 64 77 41 58 88 69 70 43 4 33 18 39 61 30 99 28 25 95 8 53 27 52 17 66 23 32 45 78 83 76 9 26 79 56 37 38 11 1 7 80 29 67 74 63 21 86 20 34 0 13 46 51 44 47 24 5 6 68 97 82 48 94 35 92 89 42 31 72 54 91 81 2 87 96 14 19 12 73 90 15"

simple_test__function "11 94 29 95 2 81 69 64 71 10 68 91 8 47 18 33 12 67 21 80 23 26 73 84 43 61 24 34 28 19 6 96 42 25 14 13 40 79 50 65 44 99 22 53 55 58 75 30 93 56 31 66 17 60 51 38 5 0 7 74 57 4 27 46 45 72 82 97 76 3 54 85 16 87 90 9 20 62 88 63 98 49 92 83 70 37 32 39 89 36 59 78 77 15 1 35 86 48 41 52"

simple_test__function "8 89 78 36 10 35 0 49 6 15 28 61 66 59 9 62 39 20 21 83 97 63 12 50 57 46 87 4 69 3 96 17 29 34 27 88 30 7 90 51 80 65 86 31 77 18 75 72 25 14 55 37 74 99 64 70 79 92 2 56 73 84 85 58 19 48 33 54 76 45 43 40 23 68 5 42 67 32 81 38 47 60 93 98 91 24 41 94 71 52 53 26 16 1 22 95 44 13 82 11"

simple_test__function "11 1 7 80 29 67 74 63 21 86 20 34 0 13 46 51 44 47 24 5 6 68 97 82 48 94 35 92 89 42 31 72 54 91 81 2 87 96 14 19 12 73 90 15 75 36 65 50 71 16 93 62 3 60 57 10 40 85 22 59 84 49 98 55 64 77 41 58 88 69 70 43 4 33 18 39 61 30 99 28 25 95 8 53 27 52 17 66 23 32 45 78 83 76 9 26 79 56 37 38"

simple_test__function "63 97 84 51 46 53 50 73 92 91 29 0 15 49 3 62 5 8 55 66 25 43 6 16 95 10 1 83 78 85 24 7 82 22 61 32 47 26 81 4 35 94 37 40 87 98 57 12 75 38 13 48 42 33 20 56 39 9 28 27 54 93 64 79 58 36 67 69 72 2 89 44 70 45 80 31 74 65 52 19 14 21 88 71 18 41 60 59 86 96 90 17 68 99 30 23 34 76 11 77"

simple_test__function "42 67 32 81 38 47 60 93 98 91 24 41 94 71 52 53 26 16 1 22 95 44 13 82 11 8 89 78 36 10 35 0 49 6 15 28 61 66 59 9 62 39 20 21 83 97 63 12 50 57 46 87 4 69 3 96 17 29 34 27 88 30 7 90 51 80 65 86 31 77 18 75 72 25 14 55 37 74 99 64 70 79 92 2 56 73 84 85 58 19 48 33 54 76 45 43 40 23 68 5"

simple_test__function "22 85 48 23 58 9 52 43 30 66 49 19 38 37 64 74 89 68 46 77 8 79 82 1 12 99 54 80 55 90 41 84 75 62 29 24 31 98 81 28 51 70 69 96 7 27 78 40 33 44 3 86 21 87 73 94 61 56 63 2 60 83 0 39 10 25 4 59 13 72 15 18 65 76 35 53 16 26 20 11 93 88 95 34 17 92 6 5 32 71 42 57 36 91 14 45 47 50 97 67"

simple_test__function "83 64 65 38 28 13 34 56 25 94 23 20 90 3 48 22 47 12 61 18 27 40 73 78 71 4 21 74 51 32 33 6 95 2 75 24 62 69 58 99 16 81 15 29 8 41 46 39 42 19 0 1 63 92 77 98 43 89 30 87 84 37 26 67 49 86 76 82 91 9 14 7 68 85 10 96 97 70 31 60 45 66 11 88 57 55 52 5 35 80 17 54 79 44 93 50 59 72 36 53"

printf "\n\n"

average_case=$((total_ins / number_tests))

check_list() {
	if [ "$1" -lt "$2" ]; then
		printf "${GREEN_FONT}$1${RESET_ALL}\n"
	else
		printf "${RED_FONT}$1${RESET_ALL}\n"
	fi
}

printf "${BLUE_FONT}%-15s${RESET_ALL}" "WORST_CASE:"
	check_list $worst_case "700"
printf "${BLUE_FONT}%-15s${RESET_ALL}" "AVERAGE_CASE:"
	check_list $average_case "700"
printf "${BLUE_FONT}%-15s${RESET_ALL}" "BEST_CASE:"
	check_list $best_case "700"

printf "\n\n"