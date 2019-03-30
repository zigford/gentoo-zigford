# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils multilib cmake-utils

DESCRIPTION="FAT filesystems explore, extract, repair, and forensic tool"
HOMEPAGE="https://github.com/Gregwar/fatcat"
SRC_URI="https://github.com/Gregwar/fatcat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DOCS="README.md docs"

src_prepare() {
	default
	cd docs/images
	gunzip *
	cmake-utils_src_prepare
}

src_compile () {
	mkdir build
	cd build
	cmake-utils_src_compile
	default
}
