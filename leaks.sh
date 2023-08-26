#!/bin/bash

cp ./src/main/push_swap.c ./tests/backup/push_swap.c

cp ./tests/push_swap_leaks.c ./src/main/push_swap.c

make all



mv ./tests/backup/push_swap.c ./src/main/push_swap.c


