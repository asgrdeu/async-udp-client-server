#!/bin/bash 

cmake --build . && make && ./udp-game-server $1 $2
