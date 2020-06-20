# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Tool that gives easy access to all of the capabilities of B2 Cloud Storage."
HOMEPAGE="https://github.com/Backblaze/B2_Command_Line_Tool"
SRC_URI="https://github.com/Backblaze/B2_Command_Line_Tool/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/tqdm-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
	=dev-python/b2sdk-0.1.8[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/B2_Command_Line_Tool-${PV}"

src_prepare() {
	cd "${S}"
	sed -ie 's/b2=b2/b2cli=b2/' setup.py
	default
}

python_install_all() {
	distutils-r1_python_install_all
}
