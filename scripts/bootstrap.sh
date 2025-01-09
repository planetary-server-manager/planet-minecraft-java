#!/bin/bash
cat logo.txt
if $AUTO_UPDATE ; then
    ./scripts/update.sh
else
    echo "Auto-updates disabled. Skipping."
fi && \
if $BACKUPS ; then
    ./scripts/backup-map.sh
else
    echo "Backups disabled. Skipping."
fi && \
./scripts/manage-server-files.sh && \
./scripts/server.sh