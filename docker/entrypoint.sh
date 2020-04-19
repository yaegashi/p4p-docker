#!/bin/bash

set -eu

if test -z "$P4TARGET"; then
        echo "E: ENV P4TARGET is not set" >&2
        exit 1
fi

mkdir -p $P4SSLDIR $P4PCACHE

if ! test -r $P4SSLDIR/privatekey.txt -a -r $P4SSLDIR/certificate.txt; then
        chmod 0700 $P4SSLDIR
        p4p -Gc
fi

if ! test -r $P4TRUST; then
        P4PORT=$P4TARGET p4 trust -y
fi

p4p -Gf

exec p4p
