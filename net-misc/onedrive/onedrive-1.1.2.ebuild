# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Onedrive sync client for Linux"
HOMEPAGE="https://github.com/abraunegg/onedrive"
SRC_URI="https://github.com/abraunegg/onedrive/archive/v1.1.2.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	=dev-lang/dmd-2.078.3
	dev-util/dub[dmd-2_078]
	dev-db/sqlite
"
RDEPEND="${DEPEND}
	net-misc/curl
	"
src_prepare() {
	default
	# Update the makefile so that it doesnt use git commands to get the version during build.
	sed -i -e 's/version:.*/version:/' \
		-e '$s/.*/\techo v1.1.2 > version/' \
		-e 's/ \/var/ $(DESTDIR)\/var/' \
		-e 's/ \/etc\/log/ $(DESTDIR)\/etc\/log/' \
		-e '30i\t\tmkdir -p $(DESTDIR)/usr/lib/systemd/user' \
		Makefile
}
