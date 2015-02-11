cmake_minimum_required(VERSION 2.8)

project(ofApp)
set(APP ofApp)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../of)

include(openFrameworks)

#ofxaddon()

set(SOURCES
    src/main.cpp
    src/ofApp.cpp
)

add_executable(
    ${APP}
    ${SOURCES}
)

target_link_libraries(
    ${APP}
    ${OFXADDONS_BEGIN}
    ${OFXADDONS_LIBRARIES}
    ${OFXADDONS_END}
    ${OPENFRAMEWORKS_LIBRARIES}
)

cotire(${APP})