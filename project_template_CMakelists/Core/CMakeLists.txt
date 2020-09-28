project(App)
cmake_minimum_required(VERSION 3.15.3)

set(APP_PATH ${CMAKE_CURRENT_SOURCE_DIR})

#  this is for advance project structure of STM32CUBEMX -> Src and Inc are moved into Core/
list(APPEND APP_MAIN
    ${APP_PATH}/Src/main.c
    ${APP_PATH}/Inc/main.h
    )

list(APPEND APP_INC_LIST
    ${APP_PATH}/Inc
    )
set(APP_INC_PATH ${APP_INC_LIST} CACHE INTERNAL "") 

if(MCU STREQUAL STM32L4xx)
    set(STM32L4xx_HAL_CONF_PATH ${APP_PATH}/Inc CACHE STRING "set stm32l4xx_hal_conf.h path")
elseif(MCU STREQUAL STM32F769xx)
    set(STM32F7xx_HAL_CONF_PATH ${APP_PATH}/Inc CACHE STRING "set stm32f7xx_hal_conf.h path")
endif()

if(FREERTOS)
    set(FREERTOS_CONFIG_PATH ${APP_PATH}/Inc CACHE STRING "set FreeRTOSConfig.h path")
    list(APPEND APP_MAIN
        ${APP_PATH}/Src/freertos.c
        )
endif(FREERTOS)

set(MAIN ${APP_MAIN} CACHE INTERNAL "") 
