project(Middlewares)
cmake_minimum_required(VERSION 3.15.3)

# Middlewares entry
add_library(Middlewares Middlewares.c)
include(LOGGER)

# FreeRTOS
option(FreeRTOS "FreeRTOS" OFF)
if(FREERTOS)
    add_subdirectory(Third_Party/FreeRTOS)
    target_link_libraries(Middlewares PUBLIC freertos)
endif(FREERTOS)

# SEGGER
option(DEBUG_OUTPUT_EN "debug_output.h" OFF)
if(DEBUG_OUTPUT_EN)
    LOGGER(LOG_WARN "DEBUG_OUTPUT enable")
    #SEGGER
    add_subdirectory(segger)
    #list(APPEND COMPILE_DEFINITIONS -DRTT_ACTIVE=1)
    set(DEBUG_TOOLS SEGGER)
    target_link_libraries(Middlewares PUBLIC SEGGER)
else()
    LOGGER(LOG_INFO "DEBUG_OUTPUT disable -> enable with -DEBUG_OUTPUT_EN=ON")
endif(DEBUG_OUTPUT_EN)

# FATFS
option(FATFS "Fatfs" OFF)
if(FATFS)
    LOGGER(LOG_INFO "FATFS ON")
    add_subdirectory(Third_Party/FatFs)
else()
    LOGGER(LOG_INFO "FATFS OFF")
endif(FATFS)

