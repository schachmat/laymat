# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit toolchain-funcs git-2

DESCRIPTION="farbfeld simple image format tools"
HOMEPAGE="http://git.2f30.org/farbfeld/about/"
EGIT_REPO_URI="git://git.2f30.org/farbfeld"
EGIT_MASTER="master"
#EGIT_COMMIT=""

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	media-libs/libpng
	media-libs/libjpeg-turbo
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	sed config.mk \
		-e '/^CC/d' \
		-e 's|/usr/local|/usr|g' \
		-e 's|^CFLAGS.*|CFLAGS += -std=c99 -pedantic -Wall -Wextra $(INCS) $(CPPFLAGS)|g' \
		-e 's|^LDFLAGS.*|LDFLAGS += $(LIBS)|g' \
		-e 's|{|(|g;s|}|)|g' \
		-i || die

	sed Makefile \
		-e 's|{|(|g;s|}|)|g' \
		-e 's|^	@|	|g' \
		-i || die
}

src_compile() {
	emake CC=$(tc-getCC)
}
