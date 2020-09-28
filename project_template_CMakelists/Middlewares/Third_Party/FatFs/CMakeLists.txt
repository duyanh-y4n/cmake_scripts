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
    )

target_link_libraries(FATFS_MIDDLEWARE STM32F7xx_HAL_Driver freertos)

target_include_directories(FATFS_MIDDLEWARE PUBLIC
    ${FATFS_MIDDLEWARE_INC_PATH}
    ${FFCONF_PATH}
    ${APP_INC_PATH}
    )

