# Nanopb's generated .pb.c files include <pb.h>. The runtime sensor-rotate
# and BLE-management Studio RPC libraries need the Nanopb module root on the
# compiler include path; the upstream module currently does not add it to
# those Zephyr library targets.
if(CONFIG_ZMK_RUNTIME_SENSOR_ROTATE_STUDIO_RPC OR CONFIG_ZMK_BLE_MANAGEMENT_STUDIO_RPC)
  if(DEFINED ZEPHYR_NANOPB_MODULE_DIR)
    zephyr_include_directories(${ZEPHYR_NANOPB_MODULE_DIR})
  endif()
endif()

if(CONFIG_SHIELD_TORABO_TSUKI_LP_LEFT OR CONFIG_SHIELD_TORABO_TSUKI_LP_RIGHT)
  zephyr_library()
  zephyr_include_directories(${APPLICATION_SOURCE_DIR}/include)
  zephyr_library_sources(src/board.c src/mini_trackpad_init_reg.c)
endif()
