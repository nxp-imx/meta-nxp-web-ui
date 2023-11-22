# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2023 NXP
do_install:append() {
    install -d ${D}${includedir}/bluez-gdbus
    install -m 0644 ${S}/gdbus/gdbus.h ${D}${includedir}/bluez-gdbus
    install -m 0644 ${B}/gdbus/.libs/libgdbus-internal.a ${D}${libdir}/libbluez-gdbus.a
}
