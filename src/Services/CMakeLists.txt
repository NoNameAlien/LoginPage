project("Services"
    VERSION 0.0.1
    DESCRIPTION "Data layer for the application"
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)

file(GLOB sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

file(GLOB headers
    ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h
)

add_library(${PROJECT_NAME}
    SHARED
        ${sources}
        ${headers}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include/
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/includes>
)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt${QT_VERSION_MAJOR}::Core)
