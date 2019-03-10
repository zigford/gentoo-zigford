# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 eutils multilib

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

DOCS="README.md TODO CHANGES.txt"
HTML_DOCS="README_epub2txt.html"
