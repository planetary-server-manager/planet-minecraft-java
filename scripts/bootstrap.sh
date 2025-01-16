#!/bin/bash
cat logo.txt
cd /scripts
if $AUTO_UPDATE ; then
    ./update.sh
else
    echo "Auto-updates disabled. Skipping."
fi && \
if $BACKUPS ; then
    ./backup-map.sh
else
    echo "Backups disabled. Skipping."
fi && \
./manage-server-files.sh && \
./allowlist.sh && \
./server.sh