# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Transparent redirector of any TCP connection to proxy"
HOMEPAGE="http://darkk.net.ru/redsocks/"
EGIT_REPO_URI="https://github.com/darkk/redsocks"
EGIT_MASTER="master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-libs/libevent
	net-firewall/iptables"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	dobin redsocks
	dodoc README doc/*
	insinto /etc/redsocks
	newins redsocks.conf.example redsocks.conf
}
