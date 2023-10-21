# Qt configuring
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

list(APPEND QT_MODULES Qml Core Quick Gui QuickControls2)
find_package(Qt6 COMPONENTS ${QT_MODULES} REQUIRED)

set(QT_PREFIXED_MODULES ${QT_MODULES})
list(TRANSFORM QT_PREFIXED_MODULES PREPEND "Qt6::")

add_compile_options(-Wall -Wextra -Wpedantic)

# Confugure and add subdirectories
add_subdirectory(Services)
add_subdirectory(Controllers)
add_subdirectory(Views)

# Building
add_executable(${PROJECT_NAME}
    main.cpp
    Views/qmlSources.qrc
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        Services
        Controllers
        Views
        ${QT_PREFIXED_MODULES}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${CONTROLLERS_INCLUDES}
)

