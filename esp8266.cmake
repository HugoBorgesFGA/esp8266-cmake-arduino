include(CMakeForceCompiler)

CMAKE_FORCE_C_COMPILER(${TOOLS_BIN}/xtensa-lx106-elf-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(${TOOLS_BIN}/xtensa-lx106-elf-g++ GNU_CXX)

set(CMAKE_CXX_COMPILER  ${TOOLS_BIN}/xtensa-lx106-elf-g++)
set(CMAKE_C_COMPILER    ${TOOLS_BIN}/xtensa-lx106-elf-gcc)
set(CMAKE_ASM_COMPILER  ${TOOLS_BIN}/xtensa-lx106-elf-gcc)
set(SIZE_COMMAND        ${TOOLS_BIN}/xtensa-lx106-elf-size)

set(CHIP ESP8266)
set(SOFTDEVICE S110)
set(BUILD_SHARED_LIBS OFF)

SET(CMAKE_ASM_FLAGS "-x assembler-with-cpp")
SET(CMAKE_C_FLAGS "-std=gnu99 -g -Os -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static -Wl,-wrap,system_restart_local -Wl,-wrap,register_chipv6_phy -Wl,--start-group -Wl,--end-group")
SET(CMAKE_CXX_FLAGS "-std=c++11 -fno-rtti -g -Os -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static -Wl,-wrap,system_restart_local -Wl,-wrap,register_chipv6_phy -Wl,--start-group -Wl,--end-group -fpermissive")
SET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "-T${SDK_ROOT}/ld/eagle.flash.512k.ld -g -Os -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static -Wl,-wrap,system_restart_local -Wl,-wrap,register_chipv6_phy -Wl,--start-group -Wl,--end-group")
SET(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "${CMAKE_SHARED_LIBRARY_LINK_C_FLAGS}")

enable_language(ASM)

add_definitions("-D__ets__")
add_definitions("-DICACHE_FLASH")
add_definitions("-DF_CPU=80000000L")
add_definitions("-DARDUINO=10605")
add_definitions("-DARDUINO_ESP8266_ESP01")
add_definitions("-DARDUINO_ARCH_ESP8266")
add_definitions("-DESP8266")
add_definitions("-DLUA_NUMBER_INTEGRAL")

# Gato
add_definitions("-U__STRICT_ANSI__")
add_definitions("-c -Os -g -mlongcalls")
add_definitions("-mtext-section-literals")
add_definitions("-fno-exceptions")
add_definitions("-falign-functions=4")
add_definitions("-MMD")