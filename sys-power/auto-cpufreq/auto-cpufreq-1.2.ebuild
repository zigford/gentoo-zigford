# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Automatic CPU speed & power optimizer for Linux"
HOMEPAGE="https://github.com/AdnanHodzic/auto-cpufreq"
SRC_URI="https://github.com/AdnanHodzic/auto-cpufreq/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~arm64 ~amd64"
IUSE=""

DEPEND="
	dev-python/psutil
	dev-python/click
	dev-python/distro
	dev-python/power
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES="${FILESDIR}/core.py.patch"

python_install_all() {
	distutils-r1_python_install_all
	MY_S=/usr/libexec/auto-cpufreq/scripts
	dodir "${MY_S}"
	cd scripts
	exeinto "${MY_S}"
	doexe auto-cpufreq-install.sh
	doexe auto-cpufreq-remove.sh
	doexe cpufreqctl.sh
	insinto "${MY_S}"
	doins auto-cpufreq.service
}
