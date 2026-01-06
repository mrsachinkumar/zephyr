# SPDX-FileCopyrightText: Copyright The Zephyr Project Contributors
# SPDX-License-Identifier: Apache-2.0

board_set_debugger_ifnset(nxp_pemicro)

board_runner_args(nxp_pemicro
  "--core-name=S32K344_M7"         # Match the script's expected core string
  "--soc-name=S32K344"
  "--soc-family-name=S32K3xx"
  "--device=NXP_S32K3xx_S32K344"
)

if(${CONFIG_XIP})
  board_runner_args(nxp_pemicro "--loadTo=flash")
else()
  board_runner_args(nxp_pemicro "loadTo=sram")
endif()


set(ZEPHYR_RUNNERS nxp_pemicro ${ZEPHYR_RUNNERS})

include(${ZEPHYR_BASE}/boards/common/nxp_pemicro.board.cmake)
