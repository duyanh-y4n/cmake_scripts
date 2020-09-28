project(CMSIS)
cmake_minimum_required(VERSION 3.15.3)


# Env variable for CMSIS
set(CMSIS_PATH ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "set cmsis path")
set(CMSIS_INC ${CMAKE_CURRENT_SOURCE_DIR}/Include CACHE INTERNAL "set cmsis include path")
list(APPEND CMAKE_MODULE_PATH ${CMSIS_PATH})

# CMSIS module
add_library(CMSIS INTERFACE)


##########################################################################################
# CMSIS submodule
##########################################################################################
## Core
#target_include_directories(CMSIS INTERFACE ${CMSIS_INC})

## Device 
#add_library(CMSIS_Device INTERFACE)
if(MCU STREQUAL STM32L496xx)
    target_include_directories(CMSIS INTERFACE 
        ${CMSIS_INC}
        ${CMSIS_PATH}/Device/ST/STM32L4xx/Include
        #$<BUILD_INTERFACE:${CMSIS_INC}>
        #$<BUILD_INTERFACE:${CMSIS_PATH}/Device/ST/STM32L4xx/Include>
        )
elseif(MCU STREQUAL STM32F769xx)
    target_include_directories(CMSIS INTERFACE 
        ${CMSIS_INC}
        ${CMSIS_PATH}/Device/ST/STM32F7xx/Include
        #$<BUILD_INTERFACE:${CMSIS_INC}>
        #$<BUILD_INTERFACE:${CMSIS_PATH}/Device/ST/STM32F7xx/Include>
        )
else()
    message("------------- ERROR-----------------")
endif()
#target_link_libraries(CMSIS INTERFACE CMSIS_Device)

## RTOS
#add_library(CMSIS_RTOS INTERFACE)
#option(RTOS "CMSIS RTOS" ON)
#option(RTOS2 "CMSIS RTOS2" OFF)
#if(RTOS)
    #target_include_directories(CMSIS_RTOS INTERFACE
        #${CMSIS_PATH}/RTOS
        #)
    #target_link_libraries(CMSIS INTERFACE CMSIS_RTOS)
#endif(RTOS)
#if(RTOS2)
    #target_include_directories(CMSIS_RTOS INTERFACE
        #${CMSIS_PATH}/RTOS2
        #)
    #target_link_libraries(CMSIS INTERFACE CMSIS_RTOS)
#endif(RTOS2)

## TODO add other module (DSP,math,...)


