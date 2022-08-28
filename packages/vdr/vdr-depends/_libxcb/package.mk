# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="_libxcb"
PKG_VERSION="1.15"
PKG_SHA256="cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059"
PKG_LICENSE="OSS"
PKG_SITE="http://xcb.freedesktop.org"
PKG_URL="http://xcb.freedesktop.org/dist/libxcb-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain util-macros Python3:host xcb-proto libpthread-stubs libXau"
PKG_LONGDESC="X C-language Bindings library."
PKG_BUILD_FLAGS="+pic"

#PKG_CONFIGURE_OPTS_TARGET="--disable-xprint \
#                           --disable-selinux \
#                           --disable-xvmc \
#                           --prefix=/usr/local"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr/local"

pre_configure_target() {
  PYTHON_LIBDIR=${SYSROOT_PREFIX}/usr/lib/${PKG_PYTHON_VERSION}
  PYTHON_TOOLCHAIN_PATH=${PYTHON_LIBDIR}/site-packages

  PKG_CONFIG+=" --define-variable=pythondir=${PYTHON_TOOLCHAIN_PATH}"
  PKG_CONFIG+=" --define-variable=xcbincludedir=${SYSROOT_PREFIX}/usr/share/xcb"
}
