# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user systemd

SRC_URI="http://download.sonarr.tv/v3/phantom-develop/${PV}/Sonarr.phantom-develop.${PV}.linux.tar.gz"

DESCRIPTION="Sonarr is a PVR for Usenet and BitTorrent users."
HOMEPAGE="http://www.sonarr.tv"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"
RDEPEND="
	>=dev-lang/mono-4.4.1.0
	media-video/mediainfo
	dev-db/sqlite"

S=${WORKDIR}/${MY_PN}
MY_PN=sonarr

pkg_setup() {
	enewgroup ${MY_PN}
	enewuser ${MY_PN} -1 -1 /var/lib/${MY_PN} ${MY_PN}
}

src_unpack() {
	unpack ${A}
	mv Sonarr ${MY_PN}
}

src_install() {
	newconfd "${FILESDIR}/${MY_PN}.conf" ${MY_PN}
	newinitd "${FILESDIR}/${MY_PN}.init" ${MY_PN}

	keepdir /var/lib/${MY_PN}
	fowners -R ${MY_PN}:${MY_PN} /var/lib/${MY_PN}

	insinto /etc/${MY_PN}
	insopts -m0660 -o ${MY_PN} -g ${MY_PN}

	insinto /etc/logrotate.d
	insopts -m0644 -o root -g root
	newins "${FILESDIR}/${MY_PN}.logrotate" ${MY_PN}

	insinto "/usr/share/"
	doins -r "${S}"

	if use systemd; then
		systemd_dounit "${FILESDIR}/${MY_PN}.service"
		systemd_newunit "${FILESDIR}/${MY_PN}.service" "${MY_PN}@.service"
	fi
}
