# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="This package provides an API for the GeoIP2 web services and databases."
HOMEPAGE="https://github.com/maxmind/GeoIP2-python"
SRC_URI="https://github.com/maxmind/GeoIP2-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/maxmind-db-reader[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/GeoIP2-python-${PV}"
