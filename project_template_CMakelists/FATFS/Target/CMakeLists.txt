add_library(FATFS_TARGET
    ${CMAKE_CURRENT_SOURCE_DIR}/bsp_driver_sd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/bsp_driver_sd.h
    ${CMAKE_CURRENT_SOURCE_DIR}/fatfs_platform.c
    ${CMAKE_CURRENT_SOURCE_DIR}/fatfs_platform.h
    #${CMAKE_CURRENT_SOURCE_DIR}/ffconf.h
    ${CMAKE_CURRENT_SOURCE_DIR}/sd_diskio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/sd_diskio.h
    )

target_include_directories(FATFS_APP PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    )
