# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="_libshaderc"
PKG_VERSION="2022.3"
PKG_SHA256="c1dee49535cfdf86994990b21fe129a74bb0d628a647f4aae8905bd61df32607"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/google/shaderc"
PKG_URL="https://github.com/google/shaderc/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain glslang"
PKG_LONGDESC="A collection of tools, libraries and tests for shader compilation."
PKG_BUILD_FLAGS="+pic"

PKG_CMAKE_OPTS_TARGET="-DSHADERC_SKIP_TESTS=on \
    				  "
pre_configure_target() {
  mkdir -p ${PKG_BUILD}/third_party
  ln -s -f $(get_build_dir spirv-tools) ${PKG_BUILD}/third_party/spirv-tools
  ln -s -f $(get_build_dir spirv-headers) ${PKG_BUILD}/third_party/spirv-headers
  ln -s -f $(get_build_dir glslang) ${PKG_BUILD}/third_party/glslang
}
