#!/bin/bash 

cmake --build . && make

install_name_tool -change /usr/local/opt/boost/lib/libboost_atomic-mt.dylib ./lib/libboost_atomic-mt.dylib udp-game-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_chrono-mt.dylib ./lib/libboost_chrono-mt.dylib udp-game-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_thread-mt.dylib ./lib/libboost_thread-mt.dylib udp-game-client

./udp-game-client
