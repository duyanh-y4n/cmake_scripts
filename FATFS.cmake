########################################################################
# FATFS scripts
########################################################################

include(LOGGER) #cmake logger

# Middleware
add_subdirectory(${PROJECT_SOURCE_DIR}/Middlewares/Third_Party/FatFs)

# Hardware target source
if(MCU STREQUAL STM32F769xx)
    #add_subdirectory(${PROJECT_SOURCE_DIR}/FATFS)
    #target_link_libraries(FATFS_HARDWARE_IMPL PUBLIC
        #FATFS_MIDDLEWARE
        #)
else()
    LOGGER(ERR "${MCU} not yet supported FATFS")
endif()

#set(FATFS FATFS_HARDWARE_IMPL FATFS_MIDDLEWARE)

