EAPI=4

inherit eutils font git-2

DESCRIPTION="A fixed font for the console and X11 intended for dwm bar usage"
HOMEPAGE="https://github.com/schachmat/status-18"
EGIT_MASTER="master"
EGIT_REPO_URI="https://github.com/schachmat/status-18"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="+pcf"

DEPEND="app-arch/gzip
	dev-lang/perl
	pcf? ( x11-apps/bdftopcf )"
RDEPEND=""

FONTDIR=/usr/share/fonts/status

REQUIRED_USE="X? ( pcf )"

src_compile() {
	if use pcf; then emake pcf; fi
}

src_install() {
	if use pcf; then
		emake DESTDIR="${D}" install-pcf
	fi

	font_src_install
}
