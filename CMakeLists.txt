project(ofApp)
set(APP ofApp)

cmake_minimum_required(VERSION 2.8)

include(../of/openFrameworks.cmake)

#ofxaddon()

set(SOURCES
    src/main.cpp
    src/ofApp.cpp
)

add_executable(
    ${APP}
    MACOSX_BUNDLE
    ${SOURCES}
    ${OFXADDONS_SOURCES}
)

target_link_libraries(
    ${APP}
    ${OPENFRAMEWORKS_LIBRARIES}
)

cotire(${APP})
