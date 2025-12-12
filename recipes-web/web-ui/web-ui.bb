# Copyright 2023 NXP
# Released under the MIT license (see COPYING.MIT for the terms)
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
DESCRIPTION = "web based UI for Orangebox demo"

RDEPENDS:${PN} = "perl php php-cli php-fpm php-cgi lighttpd bash"

SRCBRANCH = "master"

SRC_URI = "git://github.com/nxp-imx/web_server.git;protocol=https;branch=${SRCBRANCH} \
"

SRCREV = "d5bf5bf977b25024220aa716d258ded63a50d765"
SRCREV:imx8dxl-orangebox = "69298ea9b23a06bf50ecda9f387339ffb19ab90a"

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"
IMAGE_INSTALL += "openssl libssl-dev"
do_install() {
    install -d ${D}/www/pages/web_server
    cp -r ${WORKDIR}/sources/git/* ${D}/www/pages/web_server
}

FILES:${PN} += "/wwww/* /www/pages/* /www/pages/web_server/*"
