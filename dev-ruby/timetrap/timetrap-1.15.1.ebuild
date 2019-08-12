# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CONTRIBUTORS README.md"

inherit ruby-fakegem

DESCRIPTION="Timetrap is a simple command line time tracker written in ruby."
HOMEPAGE="https://github.com/samg/timetrap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

ruby_add_bdepend "
	dev-ruby/bundler
	dev-ruby/rake
	>=dev-ruby/rspec-3.5.0
	dev-ruby/fakefs
	dev-ruby/sqlite3
	dev-ruby/chronic"
ruby_add_rdepend "
	dev-ruby/sqlite3
	=dev-ruby/sequel-4.44.0"
