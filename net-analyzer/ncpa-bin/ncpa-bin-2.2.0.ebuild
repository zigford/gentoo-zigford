# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm systemd

DESCRIPTION="Nagios Cross-Platform Agent. Monitoing agent for Windows, Linux, and Mac"
HOMEPAGE="https://www.nagios.org/ncpa/"
SRC_URI="
	amd64? ( https://assets.nagios.com/downloads/ncpa/ncpa-${PV}.el8.x86_64.rpm )
	arm64? ( https://assets.nagios.com/downloads/ncpa/ncpa-${PV}.armhf.deb )
"
RESTRICT="mirror strip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"
MY_S="${WORKDIR}/usr/local/ncpa"

src_install() {
	dodir /usr/share/ncpa
	insinto /usr/share/ncpa
	exeinto /usr/share/ncpa
	cd "${MY_S}"
	doins *.so
	doins *.so.*
	doins *.py
	doins library.zip
	doexe ncpa_*
	dodir /usr/share/ncpa/listener
	insinto /usr/share/ncpa/listener
	doins -r listener/*
	dodir /usr/share/ncpa/etc
	insinto /usr/share/ncpa/etc
	doins -r etc/*
	dodir /usr/share/ncpa/var
	insinto /usr/share/ncpa/var
	doins -r var/*
	fowners -R nagios:nagios /usr/share/ncpa/var
	dodir /usr/share/ncpa/plugins
	if use systemd; then
		systemd_newunit "${FILESDIR}/ncpa_listener.service" \
			ncpa_listener.service
	fi
}
