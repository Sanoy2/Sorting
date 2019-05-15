cmake_minimum_required(VERSION 3.0)
project(a.out)

include_directories(headers)

file(GLOB SOURCES
	src/*.cpp
)

add_executable(a.out ${SOURCES})
