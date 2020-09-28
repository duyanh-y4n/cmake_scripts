add_library(FATFS_APP
    ${CMAKE_CURRENT_SOURCE_DIR}/fatfs.h
    ${CMAKE_CURRENT_SOURCE_DIR}/fatfs.c
    )

target_include_directories(FATFS_APP PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    )
