#  this is for advance project structure of STM32CUBEMX -> Src and Inc are moved into Core/
list(APPEND APP_SRC_LIST
    ${PROJECT_SOURCE_DIR}/Core/Src/main.c
    ${PROJECT_SOURCE_DIR}/Core/Inc/main.h
    )
set(APP_SRC_FILES ${APP_SRC_LIST} CACHE INTERNAL "") 

list(APPEND APP_INC_LIST
    ${PROJECT_SOURCE_DIR}/Core/Inc
    )
set(APP_INC_PATH ${APP_INC_LIST} CACHE INTERNAL "") 

