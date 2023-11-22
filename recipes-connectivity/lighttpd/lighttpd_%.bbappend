# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2023 NXP

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# conf file for web_ui based demo
SRC_URI += " \
    file://lighttpd.conf \
"
