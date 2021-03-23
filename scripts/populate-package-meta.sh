#!/bin/bash

pushd "$GITDIR/scripts"

config=../package.meta

if [ -e "$config" ]; then
	rm $config
fi
touch $config
# shellcheck disable=SC2003
cat <<package_meta >$config
[server]
version = $(python -c 'execfile("../st2common/st2common/__init__.py"); print __version__')
git_sha = $(git rev-parse --short HEAD)
circle_build_url = $ST2_CIRCLE_URL
package_meta

echo Contents of package.meta for reference:
cat ../package.meta
popd
