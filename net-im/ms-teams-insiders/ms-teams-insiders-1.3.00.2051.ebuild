# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://packages.microsoft.com/yumrepos/ms-teams/teams-insiders-${PV}-1.x86_64.rpm"

RESTRICT="primaryuri strip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	cp -pPR "${S}"/usr "${D}" || die "Failed to copy files"
}
