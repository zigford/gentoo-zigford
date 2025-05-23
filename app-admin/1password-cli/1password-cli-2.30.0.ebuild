# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The worldâ€'s most-loved password manager CLI"
HOMEPAGE="https://1password.com"
SRC_URI="amd64? ( https://cache.agilebits.com/dist/1P/op2/pkg/v${PV}/op_linux_amd64_v${PV}.zip )"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

RESTRICT="mirror strip test bindist"

DEPEND="
acct-group/onepassword-cli
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	dobin op
	chgrp onepassword-cli "${ED}/usr/bin/op" || die
	chmod g+s "${ED}/usr/bin/op" || die
}

