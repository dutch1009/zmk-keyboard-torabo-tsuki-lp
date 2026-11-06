# CMake runs this file immediately after the top-level project() command.
# Zephyr's ARM GNU toolchain identifies GCC 12.2 correctly but does not expose
# c_std_11 in CMAKE_C_COMPILE_FEATURES before Nanopb is included.
if(CMAKE_C_COMPILER_ID STREQUAL "GNU" AND
   NOT "c_std_11" IN_LIST CMAKE_C_COMPILE_FEATURES)
  list(APPEND CMAKE_C_COMPILE_FEATURES c_std_11)
endif()
