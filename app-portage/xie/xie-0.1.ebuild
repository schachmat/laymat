EAPI=5

inherit git-2

DESCRIPTION="gentoo eix with dmenu and history"
HOMEPAGE="https://github.com/schachmat/xie"
EGIT_REPO_URI="https://github.com/schachmat/xie"
EGIT_MASTER="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="app-portage/eix
         x11-misc/dmenu"

src_install() {
	dobin xie || die
}
