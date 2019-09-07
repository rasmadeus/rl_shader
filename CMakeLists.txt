cmake_minimum_required(VERSION 3.14)
project(rl_shader VERSION 1.0 LANGUAGES CXX)

if(CMAKE_COMPILER_IS_GNUCXX)
    message(STATUS "GCC detected, adding compile flags")
	add_compile_options(
		-Werror

		-Wall
		-Wextra
		-Wpedantic

		-Wcast-align
		-Wcast-qual
		-Wconversion
		-Wctor-dtor-privacy
		-Wenum-compare
		-Wfloat-equal
		-Wnon-virtual-dtor
		-Wold-style-cast
		-Woverloaded-virtual
		-Wredundant-decls
		-Wsign-conversion
		-Wsign-promo
	)
endif(CMAKE_COMPILER_IS_GNUCXX)

if(NOT CMAKE_CXX_EXTENSIONS)
    set(CMAKE_CXX_EXTENSIONS OFF)
endif()

set_target_properties(${TARGET} PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)

add_executable(rl_shader main.cpp)
