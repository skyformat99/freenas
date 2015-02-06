#!/bin/sh
#
# Script which defines variables which specify the repositories
# and branches to check out extra sources from.
# This script should not be called directly but should
# be included in other scripts.
#


SRCS_MANIFEST="${AVATAR_ROOT}/FreeBSD/repo-manifest"

if is_truenas ; then
    # Additional repos to checkout for build
    ADDL_REPOS="$ADDL_REPOS ZFSD TRUENAS_COMPONENTS KEYSERVER"

    : ${GIT_ZFSD_REPO=git@gitserver.ixsystems.com:/git/repos/truenas-build/git-repo/zfsd.git}
    : ${GIT_ZFSD_CHECKOUT_PATH="${AVATAR_ROOT}/nas_source/zfsd"}
    : ${GIT_TRUENAS_COMPONENTS_REPO=git@gitserver.ixsystems.com:/git/repos/truenas-build/truenas.git}
    : ${GIT_TRUENAS_COMPONENTS_CHECKOUT_PATH="${AVATAR_ROOT}/nas_source/truenas-components"}
    : ${GIT_KEYSERVER_REPO=git@gitserver.ixsystems.com:repos/projects/keyserver}
    : ${GIT_KEYSERVER_CHECKOUT_PATH="${AVATAR_ROOT}/nas_source/keyserver"}

    export NAS_PORTS_DIRECT=1

fi

if [ "${GIT_LOCATION}" = "EXTERNAL" ] ; then
    : ${GIT_FREEBSD_REPO=https://github.com/trueos/trueos}
    : ${GIT_PORTS_REPO=https://github.com/freenas/ports.git}
fi

: ${GIT_FREEBSD_BRANCH=9.3-STABLE}
: ${GIT_FREEBSD_REPO=git@gitserver.ixsystems.com:/git/repos/freenas-build/trueos.git}
: ${GIT_FREEBSD_CHECKOUT_PATH="${AVATAR_ROOT}/FreeBSD/src"}

: ${GIT_PORTS_BRANCH=9.3-STABLE}
: ${GIT_PORTS_REPO=git@gitserver.ixsystems.com:/git/repos/freenas-build/ports.git}
: ${GIT_PORTS_CHECKOUT_PATH="${AVATAR_ROOT}/FreeBSD/ports"}

: ${REPOS="FREEBSD PORTS ${ADDL_REPOS}"}
