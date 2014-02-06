cmake_minimum_required (VERSION 2.8)
project (MCHECK_CVC)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${MCHECK_CVC_SOURCE_DIR}/cmake_components")

if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(CMAKE_CXX_FLAGS "-stdlib=libc++")
endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -Wno-deprecated -std=c++11")

find_package(Boost 1.54 EXACT REQUIRED COMPONENTS log log_setup system program_options)
if (Boost_FOUND)
    message("boost found ${Boost_INCLUDE_DIRS} ${Boost_LIBRARIES}")
    include_directories(${Boost_INCLUDE_DIRS})
    add_definitions(-DBOOST_LOG_DYN_LINK)
else ()
    message(FATAL_ERROR "Boost 1.54 not found")
endif(Boost_FOUND)
find_package(CVC4 REQUIRED)
include_directories(${CVC4_INCLUDE_DIRS})

file(GLOB sources . src/*.cc)

add_executable(mcheck_cvc4 ${sources})
target_link_libraries(mcheck_cvc4 ${CVC4_LIBRARIES}) 
