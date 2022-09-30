cmake_minimum_required(VERSION 3.20)
project(async-udp-client-server VERSION 0.0.1)

set(CLI_PRJ_NAME async-udp-client)
set(SRV_PRJ_NAME async-udp-server)

set(EXECUTABLE_OUTPUT_PATH bin)

option(BUILD_CLI_PRJ "Enable building ${CLI_PRJ_NAME}" ON)
option(BUILD_SRV_PRJ "Enable building ${CLI_PRJ_NAME}" ON)

if(BUILD_CLI_PRJ)
    add_subdirectory(async-udp-client)
endif()

if(BUILD_SRV_PRJ)
    add_subdirectory(async-udp-server)
endif()
