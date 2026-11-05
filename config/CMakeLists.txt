zephyr_library()

if((NOT CONFIG_ZMK_SPLIT) OR CONFIG_ZMK_SPLIT_ROLE_CENTRAL)
  zephyr_library_sources_ifdef(CONFIG_ZMK_HIRES_DIAL src/behavior_hires_dial_scroll_inverted.c)
endif()
