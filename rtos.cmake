include(LOGGER) #cmake logger
add_subdirectory(${PROJECT_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS)
list(APPEND FREERTOS_APP
    ${PROJECT_SOURCE_DIR}/Core/Src/freertos.c
    )
set(RTOS freertos CACHE INTERNAL "")
set(RTOS_APP_SRC ${FREERTOS_APP} CACHE INTERNAL "")
