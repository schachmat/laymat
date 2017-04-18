# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/slock/slock-1.2.ebuild,v 1.4 2015/02/01 13:44:24 ago Exp $

EAPI=5
inherit eutils toolchain-funcs git-2

DESCRIPTION="simple randr daemon"
HOMEPAGE="https://github.com/jceb/srandrd"
EGIT_REPO_URI="https://github.com/jceb/srandrd"
EGIT_MASTER="master"
#EGIT_COMMIT=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
"
DEPEND="
	${RDEPEND}
	x11-proto/xproto
"

src_compile() {
	emake
}

src_install() {
	dobin srandrd
	doman srandrd.1
}
