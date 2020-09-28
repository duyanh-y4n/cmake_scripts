project(Drivers)
cmake_minimum_required(VERSION 3.15.3)

# empty source as lib entry
add_library(Drivers ${CMAKE_CURRENT_SOURCE_DIR}/Drivers.c)

# CMSIS submodule
add_subdirectory(CMSIS)
target_link_libraries(Drivers INTERFACE CMSIS)

# HAL and Low level drivers
if(MCU STREQUAL STM32L496xx)
    add_subdirectory(STM32L4xx_HAL_Driver)
elseif(MCU STREQUAL STM32F769xx)
    add_subdirectory(STM32F7xx_HAL_Driver)
    target_link_libraries(Drivers PUBLIC STM32F7xx_HAL_Driver)
else()
    LOGGER(ERR "HAL driver for ${MCU} not available")
endif()

## BSP(TODO)

