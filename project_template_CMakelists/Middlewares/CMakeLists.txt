project(Middlewares)
cmake_minimum_required(VERSION 3.15.3)

# Middlewares entry
add_library(Middlewares Middlewares.c)

# FreeRTOS
option(FreeRTOS "FreeRTOS" OFF)
if(FREERTOS)
    add_subdirectory(Third_Party/FreeRTOS)
    target_link_libraries(Middlewares freertos)
endif(FREERTOS)

# SEGGER
option(DEBUG_OUTPUT_EN "debug_output.h" OFF)
if(DEBUG_OUTPUT_EN)
    message(LOG_WARN "DEBUG_OUTPUT enable")
    #SEGGER
    add_subdirectory(segger)
    #list(APPEND COMPILE_DEFINITIONS -DRTT_ACTIVE=1)
    set(DEBUG_TOOLS SEGGER)
    target_link_libraries(Middlewares SEGGER)
else()
    message(LOG_INFO "DEBUG_OUTPUT disable -> enable with -DEBUG_OUTPUT_EN=ON")
endif(DEBUG_OUTPUT_EN)
