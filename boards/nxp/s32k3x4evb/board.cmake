# SPDX-FileCopyrightText: Copyright The Zephyr Project Contributors
# SPDX-License-Identifier: Apache-2.0

# board_set_debugger_ifnset(nxp_pemicro)

# board_runner_args(nxp_pemicro
#   "--core-name=S32K344_M7"         # Match the script's expected core string
#   "--soc-name=S32K344"
#   "--soc-family-name=S32K3xx"
#   "--device=NXP_S32K3xx_S32K344"
# )

# if(${CONFIG_XIP})
#   board_runner_args(nxp_pemicro "--loadTo=flash")
# else()
#   board_runner_args(nxp_pemicro "loadTo=sram")
# endif()


# set(ZEPHYR_RUNNERS nxp_pemicro ${ZEPHYR_RUNNERS})

# include(${ZEPHYR_BASE}/boards/common/nxp_pemicro.board.cmake)


board_runner_args(trace32
  "--startup-args"
    "elfFile=${PROJECT_BINARY_DIR}/${KERNEL_ELF_NAME}"
)
if(${CONFIG_XIP})
  board_runner_args(trace32 "loadTo=flash")
else()
  board_runner_args(trace32 "loadTo=sram")
endif()

board_runner_args(jlink "--device=S32K344" "--reset-after-load")
board_runner_args(pyocd "--target=s32k344")

include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/trace32.board.cmake)
