#!/bin/bash

echo "Sets the library paths.."
install_name_tool -change /usr/local/opt/boost/lib/libboost_thread-mt.dylib /usr/local/Cellar/boost/lib/libboost_thread-mt.dylib cmake-build-async-udp-client-server/async-udp-client/bin/async-udp-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_chrono-mt.dylib /usr/local/Cellar/boost/lib/libboost_chrono-mt.dylib cmake-build-async-udp-client-server/async-udp-client/bin/async-udp-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_atomic-mt.dylib /usr/local/Cellar/boost/lib/libboost_atomic-mt.dylib cmake-build-async-udp-client-server/async-udp-client/bin/async-udp-client

echo "Done!"