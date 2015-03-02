# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Tor transproxy clearnet helper"
HOMEPAGE="https://github.com/schachmat/ttpch"
EGIT_REPO_URI="https://github.com/schachmat/ttpch"
EGIT_MASTER="master"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="net-libs/libmnl
	net-firewall/iptables"
DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	dosbin ttpch
}
