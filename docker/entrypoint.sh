#!/bin/bash

set -eu

GOSU="gosu p4"

export P4DIR=/data
export P4SSLDIR=$P4DIR/ssl
export P4PCACHE=$P4DIR/cache
export P4TRUST=$P4DIR/trust

if test -z "$P4TARGET"; then
        echo "E: ENV P4TARGET is not set" >&2
        exit 1
fi

set -x

mkdir -p $P4SSLDIR $P4PCACHE
chown -R p4.p4 $P4DIR

if ! test -r $P4SSLDIR/privatekey.txt -a -r $P4SSLDIR/certificate.txt; then
        chmod 0700 $P4SSLDIR
        $GOSU p4p -Gc
fi

if ! test -r $P4TRUST; then
        $GOSU env P4PORT=$P4TARGET p4 trust -y
fi

$GOSU p4p -Gf

exec $GOSU p4p "$@"
