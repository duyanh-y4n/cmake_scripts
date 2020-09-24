########################################################################
# FATFS Middlewares 
########################################################################

set(FATFS_MIDDLEWARE_PATH ${CMAKE_CURRENT_SOURCE_DIR} CACHE INTERNAL "")
set(FATFS_MIDDLEWARE_INC_PATH ${FATFS_MIDDLEWARE_PATH}/src CACHE INTERNAL "")
add_library(FATFS_MIDDLEWARE
    # source
    ${FATFS_MIDDLEWARE_PATH}/src/diskio.c
    ${FATFS_MIDDLEWARE_PATH}/src/diskio.h
    ${FATFS_MIDDLEWARE_PATH}/src/ff.c
    ${FATFS_MIDDLEWARE_PATH}/src/ff.h
    ${FATFS_MIDDLEWARE_PATH}/src/ff_gen_drv.c
    ${FATFS_MIDDLEWARE_PATH}/src/ff_gen_drv.h
    #${FATFS_MIDDLEWARE_PATH}/src/ffconf_template.h # template
    ${FATFS_MIDDLEWARE_PATH}/src/integer.h

    # option
    #${FATFS_MIDDLEWARE_PATH}/src/option/cc932.c
    #${FATFS_MIDDLEWARE_PATH}/src/option/cc936.c
    #${FATFS_MIDDLEWARE_PATH}/src/option/cc949.c
    #${FATFS_MIDDLEWARE_PATH}/src/option/cc950.c
    #${FATFS_MIDDLEWARE_PATH}/src/option/ccsbcs.c
    ${FATFS_MIDDLEWARE_PATH}/src/option/syscall.c
    ${FATFS_MIDDLEWARE_PATH}/src/option/unicode.c

    # App
    ${PROJECT_SOURCE_DIR}/FATFS/App/fatfs.c
    ${PROJECT_SOURCE_DIR}/FATFS/App/fatfs.h

    #Target
    ${PROJECT_SOURCE_DIR}/FATFS/Target/bsp_driver_sd.c
    ${PROJECT_SOURCE_DIR}/FATFS/Target/bsp_driver_sd.h
    ${PROJECT_SOURCE_DIR}/FATFS/Target/fatfs_platform.c
    ${PROJECT_SOURCE_DIR}/FATFS/Target/fatfs_platform.h
    ${PROJECT_SOURCE_DIR}/FATFS/Target/sd_diskio.c
    ${PROJECT_SOURCE_DIR}/FATFS/Target/sd_diskio.h
    )

target_link_libraries(FATFS_MIDDLEWARE CMSIS freertos STM32F7xx_HAL_Driver)

target_include_directories(FATFS_MIDDLEWARE PUBLIC
    ${FATFS_MIDDLEWARE_INC_PATH}
    )


set(FATFS_HARDWARE_PATH ${PROJECT_SOURCE_DIR} CACHE INTERNAL "")
set(FATFS_HARDWARE_TARGET_PATH ${FATFS_HARDWARE_PATH}/Target CACHE INTERNAL "")
set(FATFS_HARDWARE_APP_PATH ${FATFS_HARDWARE_PATH}/App CACHE INTERNAL "")


target_include_directories(FATFS_MIDDLEWARE PUBLIC
    ${PROJECT_SOURCE_DIR}/FATFS/Target
    ${PROJECT_SOURCE_DIR}/FATFS/App
    ${APP_INC_PATH}
    ${PROJECT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Inc
    ${PROJECT_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS
    )

