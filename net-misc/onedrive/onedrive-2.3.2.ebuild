# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Onedrive sync client for Linux"
HOMEPAGE="https://github.com/abraunegg/onedrive"
SRC_URI="https://github.com/abraunegg/onedrive/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	net-misc/curl
	dev-db/sqlite
	libnotify? ( x11-libs/libnotify )
"

DEPEND="${RDEPEND}"

DLANG_VERSION_RANGE="2.081-"
DLANG_PACKAGE_TYPE="single"
IUSE="libnotify"

inherit dlang systemd

src_compile() {
	if use libnotify; then
		local notify=1
		local dflags_notify="-version=NoPragma -version=NoGdk -version=Notifications -L-lgmodule-2.0 -L-lglib-2.0 -L-lnotify"
	else
		local notify=0
	fi
	emake NOTIFICATIONS="${notify}" PREFIX="${ESYSROOT}/usr" DC="${DMD}" \
		DFLAGS="${DCFLAGS} -J. -L-lcurl -L-lsqlite3 ${dflags_notify} -ofonedrive"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" DOCDIR="/usr/share/doc/${PF}" install
	keepdir /var/log/onedrive
}
