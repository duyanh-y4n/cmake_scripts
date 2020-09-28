# top level CmakeLists.txt
cmake_minimum_required(VERSION 3.15.3)

##############################################################################
# Project Configs
##############################################################################
# avoid cross compile test( https://stackoverflow.com/questions/53633705/cmake-the-c-compiler-is-not-able-to-compile-a-simple-test-program/53635241 )
#set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

project(cmake_stm32cubemx C ASM)
message("Project: ${PROJECT_NAME}")

### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()

# IDE autocompletion support
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

##############################################################################
# SCRIPTS
##############################################################################
# add cmake scripts
set (CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/cmake")

##############################################################################
# some utilities
include(LOGGER) #cmake colour logger

# set toolchain 
include(toolchain-arm-none-aebi)

##############################################################################
# app src and includes
add_subdirectory(Core)

##############################################################################
# setting MCU HAL
include(MCU_Platform_init)
MCU_HAL_INIT()

##############################################################################
# TARGET
##############################################################################
#set(TARGET_OUTPUT ${PROJECT_NAME})
set(TARGET_OUTPUT target)


##############################################################################
# Linking Project
##############################################################################
add_executable(${TARGET_OUTPUT}
    ${MAIN}
    ${MCU_HAL_INIT_SRC}
    )

target_compile_definitions(${TARGET_OUTPUT} PUBLIC ${COMPILE_DEFINITIONS})

target_include_directories(${TARGET_OUTPUT} PUBLIC
    ${APP_INC_PATH} # app includes
    )


add_subdirectory(Middlewares)
target_link_libraries(${TARGET_OUTPUT} PUBLIC Middlewares)
add_subdirectory(Drivers)
target_link_libraries(${TARGET_OUTPUT} PUBLIC Drivers)
if(FATFS)
    add_subdirectory(FATFS)
    target_link_libraries(FATFS_APP PUBLIC FATFS_MIDDLEWARE)
    target_link_libraries(FATFS_APP PUBLIC FATFS_TARGET)
    target_link_libraries(FATFS_TARGET PUBLIC STM32F7xx_HAL_Driver)
    target_link_libraries(FATFS_TARGET PUBLIC FATFS_MIDDLEWARE)
    target_link_libraries(${TARGET_OUTPUT} PUBLIC FATFS_APP)
    set(FFCONF_PATH ${PROJECT_SOURCE_DIR}/FATFS/Target CACHE STRING "ffconf.h path")
endif(FATFS)


##############################################################################
include(binutils-arm-none-aebi)
print_section_sizes(${TARGET_OUTPUT})
create_hex_output(${TARGET_OUTPUT})
create_bin_output(${TARGET_OUTPUT})
