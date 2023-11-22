# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2023 NXP

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# conf file for NXP pcie9098 Connectivity
SRC_URI += " \
    file://pcie9098_mod_para.conf \
"

PACKAGES =+ "${PN}-nxp9098"

LICENSE_${PN}-nxp9098 = "Firmware-Marvell"

do_install:append () {
    # Install NXP Connectivity PCIE9098 config
    install -d ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 ${WORKDIR}/pcie9098_mod_para.conf ${D}${nonarch_base_libdir}/firmware/nxp
}

FILES:${PN}-nxp9098 += " \
       ${nonarch_base_libdir}/firmware/nxp/pcie9098_mod_para.conf \
"
