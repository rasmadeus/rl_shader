cmake_minimum_required(VERSION 3.14)
project(rl_shader VERSION 1.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Gui Qml Quick REQUIRED)
find_package(Qt5QuickCompiler)
qtquick_compiler_add_resources(RESOURCES res.qrc)

add_executable(rl_shader
    main.cpp
	${RESOURCES}
)

target_link_libraries(rl_shader Qt5::Gui Qt5::Qml Qt5::Quick)