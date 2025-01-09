#!/bin/bash
echo "Backing up map files..." && \
timestamp=$(date +%Y-%m-%d_%H-%M-%S) && \
cp -r "/server/$LEVEL_NAME" "/backups/$LEVEL_NAME-$timestamp" && \
echo "Done." || \
echo "Backup failed. This is expected if this is the first run of the server."