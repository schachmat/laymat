# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils savedconfig toolchain-funcs git-2

DESCRIPTION="Provides a single binary drawing a shell prompt with git info"
HOMEPAGE="https://github.com/schachmat/slcp"
EGIT_REPO_URI="https://github.com/schachmat/slcp"
EGIT_MASTER="master"
EGIT_COMMIT="af54bb0955eddf702e7ca341de30d5c3d9a90fe6"
LICENSE="BEER-WARE"

SLOT="0"
KEYWORDS="~x86"
IUSE="savedconfig"

DEPEND=">=dev-libs/libgit2-0.20.0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s@-I/usr/include@@" -e "s@-L/usr/lib@@" config.mk || die
	sed -i -e 's|@${CC}|$(CC)|g' Makefile || die
	restore_config config.h
	epatch_user
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install || die
	save_config config.h
}
