# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2023 NXP

DESCRIPTION = "NXP Image to demonstrate Camera in PoC"

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += " \
    debug-tweaks \
    tools-profile \
    tools-sdk \
    package-management \
    splash \
    nfs-server \
    tools-debug \
    ssh-server-openssh \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston','', d)} \
"

SDKIMAGE_FEATURES:append = " \
    staticdev-pkgs \
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

IMAGE_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'weston-xwayland xterm', '', d)} \
    imx-test \
    firmwared \
    packagegroup-imx-core-tools \
    packagegroup-imx-security \
    curl \
    ${CLINFO} \
    ${DOCKER} \
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

CLINFO              ?= ""
CLINFO:imxgpu        = "clinfo"

DOCKER            ?= ""
DOCKER:mx8-nxp-bsp = "docker"

# export IMAGE_BASENAME = "imx-image-core-web-ui"

