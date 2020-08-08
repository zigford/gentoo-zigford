# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Crossplatform python module to access power capabilities of the system."
HOMEPAGE="https://github.com/Kentzo/Power"
SRC_URI="https://github.com/Kentzo/Power/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64 ~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		dev-python/pytest
		dev-python/pytest-cov
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/Power-${PV}"

python_install_all() {
	distutils-r1_python_install_all
}
