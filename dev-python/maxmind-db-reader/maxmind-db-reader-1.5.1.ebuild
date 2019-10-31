# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="This package provides an API for the GeoIP2 web services and databases."
HOMEPAGE="https://github.com/maxmind/MaxMind-DB-Reader-python"
SRC_URI="https://github.com/maxmind/MaxMind-DB-Reader-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/MaxMind-DB-Reader-python-${PV}"

# src_prepare() {
# 	cd "${S}"
# 	sed -ie 's/b2=b2/b2cli=b2/' setup.py
# 	default
# }
# 
# python_install_all() {
# 	distutils-r1_python_install_all
# }
