#!/bin/bash

set -eu

GOSU="gosu p4"

if test -z "$P4TARGET"; then
        echo "E: ENV P4TARGET is not set" >&2
        exit 1
fi

set -x

mkdir -p $P4SSLDIR $P4PCACHE
chown -c p4:p4 /data $P4SSLDIR $P4PCACHE

if ! test -r $P4SSLDIR/privatekey.txt -a -r $P4SSLDIR/certificate.txt; then
        chmod 0700 $P4SSLDIR
        $GOSU p4p -Gc
fi

if ! test -r $P4TRUST; then
        $GOSU env P4PORT=$P4TARGET p4 trust -y
fi

$GOSU p4p -Gf

exec $GOSU p4p "$@"
