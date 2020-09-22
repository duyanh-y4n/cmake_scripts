include(LOGGER)
if(DEBUG_OUTPUT_EN STREQUAL 1)
    list(APPEND COMPILE_DEFINITIONS -DRTT_ACTIVE=1)
    LOGGER(LOG_WARN "DEBUG_OUTPUT enable")
else()
    LOGGER(LOG_INFO "DEBUG_OUTPUT disable -> enable with -DEBUG_OUTPUT_EN=1")
endif(DEBUG_OUTPUT_EN STREQUAL 1)

# TODO: make SYSVIEW work on linux
# SEGGER_SYSVIEW
#set(SEGGER_SYSVIEW TRUE CACHE INTERNAL "") # Segger System View TODO: make this as an option
#set(FREERTOSV10 TRUE CACHE INTERNAL "") # Segger System View TODO: make this as an option

#SEGGER
add_subdirectory(${PROJECT_SOURCE_DIR}/Middlewares/segger)
set(DEBUG_TOOLS SEGGER)
