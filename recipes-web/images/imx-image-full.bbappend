# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2025 NXP

DESCRIPTION = "NXP Image to demonstrate Camera in PoC"

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES:append = " \
    nfs-server \
"

WEB_UI = " \
    lighttpd \
    lighttpd-module-* \
    php \
    php-cli \
    php-fpm \
    php-cgi \
    web-ui \
"

IMAGE_INSTALL:append = " \
    packagegroup-core-full-cmdline \
    packagegroup-tools-bluetooth \
    packagegroup-fsl-gstreamer1.0 \
    packagegroup-fsl-gstreamer1.0-full \
    tcpdump \
    conntrack-tools \
    iperf3 \
    expect\
    connman connman-client\
    ${@bb.utils.contains('DEMO_FEATURES', 'web-ui', "${WEB_UI}", '', d)} \
"
# export IMAGE_BASENAME = "imx-image-core-web-ui"

