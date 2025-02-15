#!/bin/bash

sudo apt install plasma-desktop=5.27.4


set -e  # Exit on error

echo "Restoring KDE settings..."

BACKUP_FILE="$HOME/kde_backup/kde_settings_backup.tar.gz"

if [ -f "$BACKUP_FILE" ]; then
    tar -xzvf "$BACKUP_FILE" -C ~/
    echo "KDE settings restored successfully!"
else
    echo "Backup file not found! Please transfer kde_settings_backup.tar.gz to $HOME/kde_backup and try again."
    exit 1
fi

echo "Restarting KDE..."
kquitapp5 plasmashell && kstart5 plasmashell

echo "Done!"
