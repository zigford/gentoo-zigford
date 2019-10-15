# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Easily print BTRFS subvolume/snapshot disk usage"
HOMEPAGE="https://github.com/nachoparker/btrfs-du"
SRC_URI="https://github.com/nachoparker/btrfs-du/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-fs/btrfs-progs"

DOCS="README.md LICENSE"

src_install(){
	exeinto /usr/sbin
	doexe btrfs-du
}
