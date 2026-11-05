# Work around Zephyr 4.1's Nanopb CMake feature detection when Nanopb
# is included from an external module before the C standard features are
# propagated to module scope.
if(DEFINED compile_features_c11)
  list(APPEND CMAKE_C_COMPILE_FEATURES ${compile_features_c11})
endif()

if(CONFIG_SHIELD_TORABO_TSUKI_LP_LEFT OR CONFIG_SHIELD_TORABO_TSUKI_LP_RIGHT)
  zephyr_library()
  zephyr_include_directories(${APPLICATION_SOURCE_DIR}/include)
  zephyr_library_sources(src/board.c src/mini_trackpad_init_reg.c)
endif()
