#! /bin/sh

set -ex

BASE_IMAGES="gnocchi-base collectd-base"
OLD_PATH=$PWD

finish() {
    cd $OLD_PATH
}

trap finish EXIT

cd base
for IMG in $BASE_IMAGES; do
	docker build --no-cache -f Dockerfile-$IMG -t $IMG .
done

