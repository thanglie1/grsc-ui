cmake_minimum_required(VERSION 3.1)

project(ui-free-tool LANGUAGES CXX)

set(QT_DIR D:/X/Qt/5.12.5/msvc2017)
set(QML_DIR ../qml)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(Qt5_DIR 		"${QT_DIR}/lib/cmake/Qt5")
set(Qt5Quick_DIR 	"${QT_DIR}/lib/cmake/Qt5Quick")
set(Qt5Widgets_DIR 	"${QT_DIR}/lib/cmake/Qt5Widgets")
set(qmake_DIR 		"${QT_DIR}/bin")

find_package(Qt5 COMPONENTS Widgets Quick REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)

set (SOURCES 
	main.cpp
	dashboard.cpp
	applications.cpp
	cveinfo.cpp
	todoinfo.cpp
	)
set (HEADERS
	dashboard.h
	applications.h
	cveinfo.h
	todoinfo.h
	)
set (RESOURCES
	qml.qrc
	constant.h)
	
if (WIN32)
    set(WIN32_ON_OFF_SWITCH "WIN32")
else ()
    set(WIN32_ON_OFF_SWITCH "")
endif ()

add_executable(${PROJECT_NAME}
	${WIN32_ON_OFF_SWITCH}
	# source files that are actually built direclty
	${SOURCES}
	# items included so they show up in your IDE
    ${HEADERS}
    ${RESOURCES}
	)
	
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Quick Qt5::Widgets)

get_target_property(_qmake_executable Qt5::qmake IMPORTED_LOCATION)
get_filename_component(_qt_bin_dir "${_qmake_executable}" DIRECTORY)
find_program(WINDEPLOYQT_EXECUTABLE windeployqt HINTS "${_qt_bin_dir}")
find_program(MACDEPLOYQT_EXECUTABLE macdeployqt HINTS "${_qt_bin_dir}")
add_custom_command(TARGET ui-free-tool POST_BUILD
    COMMAND "${CMAKE_COMMAND}" -E
        env PATH="${_qt_bin_dir}" "${WINDEPLOYQT_EXECUTABLE}" --qmldir "${QML_DIR}"
            "$<TARGET_FILE:ui-free-tool>" --no-translations --no-opengl-sw --no-angle --no-webkit2 --no-compiler-runtime --no-system-d3d-compiler --no-patchqt
    COMMENT "Running windeployqt..."
)
#add_custom_command(TARGET ui-free-tool POST_BUILD
#    COMMAND "${MACDEPLOYQT_EXECUTABLE}"
#        "$<TARGET_FILE_DIR:ui-free-tool>/../.."
#        -always-overwrite
#    COMMENT "Running macdeployqt..."
#)