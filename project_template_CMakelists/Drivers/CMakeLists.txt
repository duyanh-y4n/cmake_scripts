######################################################
# Drivers CMakeLists
######################################################

# HAL and Low level drivers
if(MCU STREQUAL STM32L496xx)
    add_subdirectory(STM32L4xx_HAL_Driver)
elseif(MCU STREQUAL STM32F769xx)
    add_subdirectory(STM32F7xx_HAL_Driver)
else()
    LOGGER(ERR "HAL driver for ${MCU} not available")
endif()

# CMSIS
add_subdirectory(CMSIS)
