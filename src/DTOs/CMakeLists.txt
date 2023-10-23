project("DTOs"
    VERSION 0.0.1
    DESCRIPTION "Controllers for communication between view and business logic layers"
)

set(CMAKE_AUTOMOC ON)

file(GLOB_RECURSE sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

file(GLOB_RECURSE headers
    ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h
)

add_library(${PROJECT_NAME}
    SHARED
        ${sources}
        ${headers}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include/${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)