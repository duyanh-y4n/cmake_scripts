include(LOGGER)

# FreeRTOS env include path
set(FREERTOS_INC ${CMAKE_CURRENT_SOURCE_DIR}/Source/include CACHE INTERNAL "")
set(FREERTOS_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/Source/ CACHE INTERNAL "")
set(FREERTOS_MEMMANG ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/MemMang CACHE INTERNAL "")
set(FREERTOS_CMSIS_OS ${CMAKE_CURRENT_SOURCE_DIR}/Source/CMSIS_RTOS CACHE INTERNAL "")
if(MCU STREQUAL STM32L496xx) #TODO: use MCU var instead
    set(FREERTOS_GCC ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/GCC/ARM_CM4F CACHE INTERNAL "")
elseif(MCU STREQUAL STM32F769xx)
    set(FREERTOS_GCC ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/GCC/ARM_CM7/r0p1 CACHE INTERNAL "")
else()
    LOGGER(LOG_ERR "MCU not supported")
endif()

add_library(freertos
    # CMSIS_RTOS
    ${FREERTOS_CMSIS_OS}/cmsis_os.c

    # portable gcc
    ${FREERTOS_GCC}/port.c # TODO: add support for other mcu

    # portable memory manager -> choose 1
    #${FREERTOS_MEMMANG}/heap_1.c
    #${FREERTOS_MEMMANG}/heap_2.c
    #${FREERTOS_MEMMANG}/heap_3.c
    ${FREERTOS_MEMMANG}/heap_4.c
    #${FREERTOS_MEMMANG}/heap_5.c
    
    # freertos source
    ${FREERTOS_SOURCE}/croutine.c
    ${FREERTOS_SOURCE}/event_groups.c
    ${FREERTOS_SOURCE}/list.c
    ${FREERTOS_SOURCE}/queue.c
    ${FREERTOS_SOURCE}/stream_buffer.c
    ${FREERTOS_SOURCE}/tasks.c
    ${FREERTOS_SOURCE}timers.c
    )

target_include_directories(freertos PUBLIC
    ${FREERTOS_CMSIS_OS}
    ${FREERTOS_INC}
    ${FREERTOS_GCC}# TODO: add support for other mcu
    ${APP_INC_PATH} # FreeRTOSConfig.h location
    )

target_link_libraries(freertos CMSIS) # add CMSIS_RTOS interface

if(SEGGER_SYSVIEW STREQUAL TRUE)
    if(FREERTOSV10 STREQUAL TRUE) # SEGGER System View
        LOGGER(LOG_INFO "FreeRTOS: linking SEGGER_SYSVIEW")
        target_include_directories(freertos PUBLIC
            ${SEGGER_SAMPLE}/FreeRTOSV10
            ${SEGGER_SRC}
            ${SEGGER_CONF}
            )
    else()
        LOGGER(LOG_ERR "FreeRTOS: this version not supported Sysview")
    endif(FREERTOSV10 STREQUAL TRUE)
else()
    LOGGER(LOG_WARN "FreeRTOS: skipping SEGGER_SYSVIEW include directories")
endif(SEGGER_SYSVIEW STREQUAL TRUE)
