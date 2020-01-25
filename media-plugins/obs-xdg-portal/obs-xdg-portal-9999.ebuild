# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 ninja-utils meson

DESCRIPTION="OBS Studio plugin using the Desktop portal for Wayland & X11 screencasting."
HOMEPAGE="https://gitlab.gnome.org/feaneron/obs-xdg-portal"
EGIT_REPO_URI="https://gitlab.gnome.org/feaneron/obs-xdg-portal.git"
EGIT_SUBMODULES=()

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	x11-wm/mutter[screencast]
	media-video/obs-studio
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	dev-util/ninja
"

MY_S="${S}-build"

src_install() {
	elog "$(pwd)"
	cd "${MY_S}"
	insinto /usr/$(get_libdir)/obs-plugins/
	doins obs-xdg-portal.so
}
