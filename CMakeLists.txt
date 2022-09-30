cmake_minimum_required(VERSION 3.20)
project(game VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUERED True)

set(Boost_INCLUDE_DIR /usr/local/Cellar/boost/include)

#find_package(Boost COMPONENTS system filesystem REQUIRED)

include_directories(${Boost_INCLUDE_DIR})

#add_subdirectory(src)

add_executable(${PROJECT_NAME} ./connections/talk-to-client.cpp)

#target_link_libraries( ${library_LIBRARIES})

