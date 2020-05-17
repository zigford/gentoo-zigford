# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

MY_PN=${PN/-bin/}
inherit desktop

DESCRIPTION="An open-world game whose gameplay revolves around breaking and placing blocks"
HOMEPAGE="http://www.minecraft.net"
SRC_URI="
	https://github.com/Tabinol/gentoo-minecraft/archive/2.1.2482.tar.gz -> ${P}-sh.tar.gz
	https://launcher.mojang.com/download/linux/x86_64/minecraft-launcher_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Minecraft"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

# Optionally enable the skins tab. Allow to disable where libglvnd is not desired

IUSE="libglvnd"

S="${WORKDIR}/gentoo-minecraft-${PV}"

RDEPEND=">=virtual/jre-1.8.0
	>=x11-apps/xrandr-1.4.3
	virtual/ttf-fonts
	gnome-base/gconf
	libglvnd? ( media-libs/libglvnd )"

DEPEND=""

src_unpack() {
	unpack ${P}-sh.tar.gz
	unpack ${P}.tar.gz
	cd "${WORKDIR}"
	mv gentoo-minecraft-2.1.2482 gentoo-minecraft-${PV}
}

src_install() {
	pushd ../minecraft-launcher
	insinto /opt/${MY_PN}
	doins -r .
	fperms +x /opt/${MY_PN}/chrome-sandbox
	fperms +x /opt/${MY_PN}/libcef.so
	fperms +x /opt/${MY_PN}/minecraft-launcher
	dodir /opt/${MY_PN}/swiftshader
	dosym /usr/$(get_libdir)/libEGL.so /opt/${MY_PN}/swiftshader/libEGL.so
	dosym /usr/$(get_libdir)/libGLESv2.so /opt/${MY_PN}/swiftshader/libGLESv2.so
	popd
	dobin "${MY_PN}"
	doicon "${MY_PN}.png"
	make_desktop_entry "${MY_PN}" "Minecraft" "minecraft"
}
