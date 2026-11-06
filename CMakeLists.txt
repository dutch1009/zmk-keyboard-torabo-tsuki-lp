# Zephyr's ARM GNU toolchain may omit the C11 feature from its feature list
# even though the bundled GCC 12.2 compiler supports it. Nanopb's FindNanopb.cmake
# requires this feature when the runtime sensor-rotate Studio RPC module is enabled.
if(NOT "c_std_11" IN_LIST CMAKE_C_COMPILE_FEATURES)
  list(APPEND CMAKE_C_COMPILE_FEATURES c_std_11)
endif()

# This file is loaded as an extra Zephyr module. Propagate the feature to the
# parent directory so sibling modules (including runtime-sensor-rotate) see it
# when Nanopb calls target_compile_features().
set(CMAKE_C_COMPILE_FEATURES "${CMAKE_C_COMPILE_FEATURES}" PARENT_SCOPE)

if(CONFIG_SHIELD_TORABO_TSUKI_LP_LEFT OR CONFIG_SHIELD_TORABO_TSUKI_LP_RIGHT)
  zephyr_library()
  zephyr_include_directories(${APPLICATION_SOURCE_DIR}/include)
  zephyr_library_sources(src/board.c src/mini_trackpad_init_reg.c)
endif()
