# add CMSIS includes as interface (will be implemented somewhere else by MCU platform)
set(CMSIS_PATH ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "set cmsis path")
set(CMSIS_INC ${CMAKE_CURRENT_SOURCE_DIR}/Include CACHE INTERNAL "set cmsis include path")
add_library(CMSIS INTERFACE)

# Device cmsis
if(MCU STREQUAL STM32L496xx)
    target_include_directories(CMSIS INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32L4xx/Include)
elseif(MCU STREQUAL STM32F769xx)
    target_include_directories(CMSIS INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32F7xx/Include)
endif()

target_include_directories(CMSIS INTERFACE ${CMSIS_INC})

#TODO add other module (DSP,math,...)
