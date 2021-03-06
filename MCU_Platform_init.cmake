# list of supported MCU
list(APPEND MCU_LIST 
    STM32L496xx
    STM32F769xx
    )

#########################################################################
# STM_HAL_INIT
#########################################################################
function(STM_HAL_INIT STM_MCU)
    # STM32L4
    if(${STM_MCU} STREQUAL STM32L496xx)
        add_definitions(-DUSE_HAL_DRIVER -DSTM32L496xx)
        # Set linker and GCC flags fot MCU
        set(STM_LINKER_PATH "${PROJECT_SOURCE_DIR}")
        set(LINKER_SCRIPT ${STM_LINKER_PATH}/STM32L496ZGTx_FLASH.ld) # TODO: define linker script externally
        include(stm32l4)
        
        list(APPEND STM_HAL_INIT_SRC
            # board config (autognerated)
            ${PROJECT_SOURCE_DIR}/Src/stm32l4xx_hal_msp.c
            ${PROJECT_SOURCE_DIR}/Src/stm32l4xx_it.c
            ${PROJECT_SOURCE_DIR}/Src/system_stm32l4xx.c
            #startup file
            ${PROJECT_SOURCE_DIR}/startup_stm32l496xx.s
            )
        set(MCU_HAL_INIT_SRC ${STM_HAL_INIT_SRC} CACHE INTERNAL "")

    # STM32F7
    elseif(${STM_MCU} STREQUAL STM32F769xx)
        add_definitions(-DUSE_HAL_DRIVER -DSTM32F769xx)
        # Set linker and GCC flags fot MCU
        set(STM_LINKER_PATH "${PROJECT_SOURCE_DIR}")
        set(LINKER_SCRIPT ${STM_LINKER_PATH}/STM32F769NIHx_FLASH.ld)
        include(stm32f7)
        
        # STM32CUBEMX autogenerated board config
        list(APPEND STM_HAL_INIT_SRC
            # board config (autognerated)
            ${PROJECT_SOURCE_DIR}/Core/Src/stm32f7xx_hal_msp.c
            ${PROJECT_SOURCE_DIR}/Core/Src/stm32f7xx_it.c
            ${PROJECT_SOURCE_DIR}/Core/Src/system_stm32f7xx.c
            #startup file
            ${PROJECT_SOURCE_DIR}/startup_stm32f769xx.s
            )
        set(MCU_HAL_INIT_SRC ${STM_HAL_INIT_SRC} CACHE INTERNAL "")

    else()
        LOGGER(LOG_ERR "MCU ${STM_MCU} not supported")
    endif()
endfunction(STM_HAL_INIT STM_MCU)

#########################################################################
# MCU_HAL_INIT
#########################################################################
function(MCU_HAL_INIT)
    list(FIND MCU_LIST ${MCU} _index)
    if(_index EQUAL -1)
        LOGGER(LOG_ERR "MCU ${MCU} not supported")
    endif(_index EQUAL -1)

    if(${MCU} STREQUAL STM32L496xx)
        LOGGER(LOG_INFO "initializing HAL for ${MCU} ")
        STM_HAL_INIT(${MCU})
    elseif(${MCU} STREQUAL STM32F769xx)
        LOGGER(LOG_INFO "initializing HAL for ${MCU} ")
        STM_HAL_INIT(${MCU})
    endif()
endfunction(MCU_HAL_INIT)
