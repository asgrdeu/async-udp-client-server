#!/bin/bash

echo "Remove build directory if exist.."
rm -rf async-udp-client-server-build

echo "Create build directory.."
mkdir async-udp-client-server-build && cd async-udp-client-server-build

echo "Running cmake.."
cmake .. && make

echo "Return to root directory.."
cd ..

echo "Sets the library paths.."
install_name_tool -change /usr/local/opt/boost/lib/libboost_thread-mt.dylib /usr/local/Cellar/boost/lib/libboost_thread-mt.dylib async-udp-client-server-build/async-udp-client/bin/async-udp-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_chrono-mt.dylib /usr/local/Cellar/boost/lib/libboost_chrono-mt.dylib async-udp-client-server-build/async-udp-client/bin/async-udp-client
install_name_tool -change /usr/local/opt/boost/lib/libboost_atomic-mt.dylib /usr/local/Cellar/boost/lib/libboost_atomic-mt.dylib async-udp-client-server-build/async-udp-client/bin/async-udp-client

echo "Done!"