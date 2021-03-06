# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/slock/slock-1.2.ebuild,v 1.4 2015/02/01 13:44:24 ago Exp $

EAPI=5
inherit eutils fcaps savedconfig toolchain-funcs git-2

DESCRIPTION="simple X screen locker"
HOMEPAGE="http://tools.suckless.org/slock"
EGIT_REPO_URI="https://github.com/schachmat/slock"
EGIT_MASTER="config"
#EGIT_COMMIT=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 hppa x86 ~x86-fbsd"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="
	${RDEPEND}
	x11-proto/xproto
"

src_prepare() {
	sed -i \
		-e '/^CFLAGS/{s: -Os::g; s:= :+= :g}' \
		-e '/^CC/d' \
		-e '/^LDFLAGS/{s:-s::g; s:= :+= :g}' \
		config.mk || die
	sed -i \
		-e 's|@${CC}|$(CC)|g' \
		Makefile || die
	if use elibc_FreeBSD; then
		sed -i -e 's/-DHAVE_SHADOW_H//' config.mk || die
	fi
	restore_config config.h
	tc-export CC
}

src_compile() { emake slock; }

src_install() {
	dobin slock
	save_config config.h
}

pkg_postinst() {
	# cap_dac_read_search used to be enough for shadow access
	# but now slock wants to write to /proc/self/oom_score_adj
	# and for that it needs:
	fcaps cap_dac_override,cap_sys_resource /usr/bin/slock

	savedconfig_pkg_postinst
}
