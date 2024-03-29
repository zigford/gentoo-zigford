# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg-utils

MY_PV="$(ver_rs 3 '-')"
MY_BETA="${PN/1password/}"
MY_BETA="${MY_BETA/-}"
MY_P="${MY_BETA:+${PN/beta/${MY_PV}.BETA}}"
MY_P="${MY_P:=${PN}-${MY_PV}}"

DESCRIPTION="The world’s most-loved password manager"
HOMEPAGE="https://1password.com"
SRC_URI="amd64? ( https://downloads.1password.com/linux/rpm/${MY_BETA:-stable}/x86_64/${MY_P}.x86_64.rpm -> ${P}.x86_64.rpm )"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

RESTRICT="mirror strip test bindist"

IUSE="policykit cli"

DEPEND="
x11-misc/xdg-utils
acct-group/onepassword
policykit? ( sys-auth/polkit )
cli? ( app-admin/1password-cli )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_prepare() {
  default
  xdg_environment_reset
}

src_unpack() {
  rpm_unpack ${P}.x86_64.rpm
}

src_install() {
  cp -ar "${S}/opt"  "${D}" || die "Install failed!"
  cp -ar "${S}/usr"  "${D}" || die "Install failed!"

  chgrp onepassword ${D}/opt/1Password/1Password-BrowserSupport

  dosym /opt/1Password/1password /usr/bin/1password
  if use policykit ; then
	insinto /usr/share/polkit-1/actions
	newins opt/1Password/com.1password.1Password.policy.tpl \
		com.1password.1Password.policy
  fi
}

pkg_postinst() {
  chmod 4755 /opt/1Password/chrome-sandbox
  chmod 6755 /opt/1Password/1Password-KeyringHelper
  chmod 2755 /opt/1Password/1Password-BrowserSupport

  xdg_icon_cache_update
  xdg_desktop_database_update
  xdg_mimeinfo_database_update
}

pkg_postrm() {
  xdg_icon_cache_update
  xdg_desktop_database_update
  xdg_mimeinfo_database_update
}
