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

include(DEBUG_TOOLS) # debug output


##############################################################################
# app src and includes
include(app)

##############################################################################
# setting MCU HAL
include(MCU_Platform_init)
MCU_HAL_INIT(${MCU})

##############################################################################
# third party middlewares
## FREERTOS
include(rtos)
##############################################################################
# TARGET
##############################################################################
#set(TARGET_OUTPUT ${PROJECT_NAME})
set(TARGET_OUTPUT target.elf)


##############################################################################
# Linking Project
##############################################################################
add_executable(${TARGET_OUTPUT}
    ${APP_SRC_FILES}
    )

target_compile_definitions(${TARGET_OUTPUT} PUBLIC ${COMPILE_DEFINITIONS})

target_include_directories(${TARGET_OUTPUT} PUBLIC
    ${APP_INC_PATH} # app includes
    )

target_link_libraries(${TARGET_OUTPUT} ${MCU_HAL_DRIVER})
target_sources(${TARGET_OUTPUT} PUBLIC
    ${MCU_HAL_INIT_SRC}
    )

target_link_libraries(${TARGET_OUTPUT} ${RTOS})
target_sources(${TARGET_OUTPUT} PUBLIC
    ${RTOS_APP_SRC}
    )

target_link_libraries(${TARGET_OUTPUT} ${DEBUG_TOOLS})
