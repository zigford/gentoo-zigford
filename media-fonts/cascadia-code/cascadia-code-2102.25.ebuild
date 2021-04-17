# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Monospaced font designed for Windows Terminal"
HOMEPAGE="https://github.com/microsoft/cascadia-code"
SRC_URI="https://github.com/microsoft/cascadia-code/releases/download/v${PV}/CascadiaCode-${PV}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

FONT_SUFFIX="ttf"

S="${WORKDIR}/ttf"
