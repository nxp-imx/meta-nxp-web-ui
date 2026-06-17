# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2023 NXP

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# conf file for web_ui based demo
SRC_URI += " \
    file://lighttpd.conf \
    file://override.conf \
"

do_install:append () {
    install -d ${D}${sysconfdir}/systemd/system/lighttpd.service.d

    if [ -f ${WORKDIR}/override.conf ]; then
        install -m 0644 ${WORKDIR}/override.conf \
            ${D}${sysconfdir}/systemd/system/lighttpd.service.d/
    else
        install -m 0644 ${WORKDIR}/sources/override.conf \
            ${D}${sysconfdir}/systemd/system/lighttpd.service.d/
    fi
}
