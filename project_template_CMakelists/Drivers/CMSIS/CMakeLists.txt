# add CMSIS includes as interface (will be implemented somewhere else by MCU platform)
set(CMSIS_INC ${CMAKE_CURRENT_SOURCE_DIR}/Include CACHE INTERNAL "set cmsis include path")
add_library(CMSIS INTERFACE)
target_include_directories(CMSIS INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32L4xx/Include)
target_include_directories(CMSIS INTERFACE ${CMSIS_INC})

#TODO add other module (DSP,math,...)
