# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Onedrive sync client for Linux"
HOMEPAGE="https://github.com/skilion/onedrive"
SRC_URI="https://github.com/skilion/onedrive/archive/v1.1.1.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	=dev-lang/dmd-2.080.0
	dev-util/dub[dmd-2_080]
	dev-db/sqlite
"
RDEPEND="${DEPEND}
	net-misc/curl
	"
src_prepare() {
	default
	# Update the makefile so that it doesnt use git commands to get the version during build.
	sed -i -e 's/version:.*/version:/' Makefile
	sed -i -e '$s/.*/\techo v1.1.1 > version/' Makefile
}
