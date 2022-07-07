#!/bin/bash -x

set -e -o pipefail

# remove old installers
rm -f Disk\ Image/*.pkg

. ./env.sh

GIT_VERSION=${1:-$(current-git-version)}

echo $GIT_VERSION

do-make clean
do-make package

echo "Testing the installer..."

# Notw: the test_installer.sh opens created PKG and waits until this package will be installed. In case you will not install it, that DMG creation will be skipped. So, comenting this for now.
#. test_installer.sh

do-make deploy
