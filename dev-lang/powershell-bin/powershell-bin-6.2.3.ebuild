# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

MY_PR=${PR:1}
PREVIEW=${PN#powershell-}
PREVIEW=${PREVIEW%bin}
PREVIEW=${PREVIEW%-}
PREVIEW=${PREVIEW}${PREVIEW:+.}${PREVIEW:+$MY_PR}
MY_V=${PREVIEW:+-}${PREVIEW}
MY_W=${PREVIEW:+_}${PREVIEW}
MY_SV=${PV:1}
MY_PN=${PN%-bin}

DESCRIPTION="A cross-platform automation and configuration tool/framework"
HOMEPAGE="https://github.com/Powershell/Powershell"
SRC_URI="
	amd64? ( https://github.com/PowerShell/PowerShell/releases/download/v${PV}${MY_V}/${MY_PN}-${PV}${MY_W}-1.rhel.7.x86_64.rpm )
	arm64? ( https://github.com/PowerShell/PowerShell/releases/download/v${PV}${MY_V}/powershell-${PV}${MY_V}-linux-arm64.tar.gz )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/icu
	sys-libs/libunwind
	|| ( =dev-libs/openssl-1.0* dev-libs/openssl:1.0.0 =dev-libs/openssl-compat-1.0* )"

S="${WORKDIR}"

src_prepare() {
	#fix symlinks
	if test -d opt
	then
		rm opt/microsoft/powershell/${PV:0:1}${PREVIEW:+-preview}/{libcrypto.so.1.0.0,libssl.so.1.0.0}
	fi
	default
}

src_install() {
	# Using doins -r would strip executable bits from all binaries
	if test -d opt
	then
		cp -pPR "${S}"/{opt,usr/bin} "${D}"/ || die "Failed to copy files"
		gunzip "${S}/usr/local/share/man/man1/pwsh.1.gz"
		doman "${S}/usr/local/share/man/man1/pwsh.1"
	else
		OPTDIR="opt/microsoft/powershell/${PV:0:1}${PREVIEW:+-preview}"
		dodir "${EPREFIX}/${OPTDIR}"
		insinto "${EPREFIX}/${OPTDIR}"
		doins -r */ || die
		for i in a dll json pdb so txt xml
		do
		    doins *.$i
		done
		exeinto "${EPREFIX}/${OPTDIR}"
		doexe pwsh || die
		dodir "${EPREFIX}/bin"
		dosym "${EPREFIX}/${OPTDIR}/pwsh" "${EPREFIX}/bin/pwsh${PREVIEW:+-preview}"
	fi
	dosym "${EPREFIX}/usr/$(get_libdir)/libcrypto.so.1.0.0" /opt/microsoft/powershell/${PV:0:1}${PREVIEW:+-preview}/libcrypto.so.1.0.0
	dosym "${EPREFIX}/usr/$(get_libdir)/libssl.so.1.0.0" /opt/microsoft/powershell/${PV:0:1}${PREVIEW:+-preview}/libssl.so.1.0.0
}
