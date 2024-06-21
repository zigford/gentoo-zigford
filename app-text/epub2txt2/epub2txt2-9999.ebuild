# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 multilib

DESCRIPTION="A simple command-line utility for extracting text from EPUB documents"
HOMEPAGE="http://kevinboone.net/README_epub2txt.html"

EGIT_REPO_URI="https://github.com/kevinboone/epub2txt2"
EGIT_BRANCH="master"
DOCS="CHANGES.txt README.md README_epub2txt.html TODO"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	app-arch/unzip
	sys-devel/gcc
"
DEPEND="
	${COMMON_DEPEND}
"
RDEPEND="${COMMON_DEPEND}"

DOCS="README.md TODO LICENSE"

src_prepare() {
	default
	# prevent pre-stripping
	sed -e 's:-s $(EXTRA_LDFLAGS):$(EXTRA_LDFLAGS):' -i Makefile
}

src_install() {
	dobin epub2txt
	doman man1/epub2txt.1
}
