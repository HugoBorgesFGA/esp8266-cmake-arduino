cmake_minimum_required (VERSION 2.8.11)

project(ESP8266_FW)

set(SKETCHS_ROOT        "${PROJECT_SOURCE_DIR}/esp8266")
set(ESP_ROOT            "${PROJECT_SOURCE_DIR}/esp8266")
set(CORE_ROOT           "${ESP_ROOT}/cores/esp8266")

set(SDK_ROOT            "${ESP_ROOT}/tools/sdk")
set(TOOLS_ROOT          "${ESP_ROOT}/tools")
set(TOOLCHAIN_ROOT      "${TOOLS_ROOT}/xtensa-lx106-elf")
set(TOOLS_BIN           "${TOOLCHAIN_ROOT}/bin")

include(esp8266.cmake)

set(BASIC_INCLUDE_DIRS
    "${ESP_ROOT}/cores/esp8266"
    "${ESP_ROOT}/variants/generic"
	"${SDK_ROOT}/include"
    "${SDK_ROOT}/lwip/include"
    #"${OBJ_DIR}"
)

set(BASIC_LINK_DIRS
	"${SDK_ROOT}/lib"
	"${TOOLCHAIN_ROOT}/lib"
)

set(BASIC_LIBS 
	gcc 
	hal 
	phy 
	net80211 
	lwip 
	wpa 
	main 
	pp 
	smartconfig
	wps 
	crypto
)

link_directories(${BASIC_LINK_DIRS})
include_directories(${BASIC_INCLUDE_DIRS})

add_subdirectory(esp8266)
#add_subdirectory(sketchs)