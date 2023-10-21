project("Controllers"
    VERSION 0.0.1
    DESCRIPTION "Controllers for communication between view and business logic layers"
)

find_package(Qt6 COMPONENTS ${QT_MODULES} REQUIRED)

set(CMAKE_AUTOMOC ON)

file(GLOB controllers_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Controllers/*.cpp
)

file(GLOB controllers_headers
    ${CMAKE_CURRENT_SOURCE_DIR}/include/Controllers/*.h
)

file(GLOB dtos_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/src/DTOs/*.cpp
)

file(GLOB dtos_headers
    ${CMAKE_CURRENT_SOURCE_DIR}/include/DTOs/*.h
)

add_library(${PROJECT_NAME}
    SHARED
        ${controllers_sources}
        ${controllers_headers}
        ${dtos_sources}
        ${dtos_headers}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include/Controllers
        ${CMAKE_CURRENT_SOURCE_DIR}/../Services/include
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC 
        Services
        ${QT_PREFIXED_MODULES}
)
