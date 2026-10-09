#!/bin/bash
# backup.sh --- резервная копия самого себя в ~/backup

BACKUP_DIR="$HOME/backup"
SELF="$0"

# Создать каталог backup, если его нет
mkdir -p "$BACKUP_DIR"

# Имя архива: backup.sh_2026-10-09_22-10-00.tar.bz2
FILENAME="$(basename "$SELF")_$(date +%Y-%m-%d_%H-%M-%S)"

# Архивация через tar + bzip2
tar -cjf "$BACKUP_DIR/$FILENAME.tar.bz2" "$SELF"

echo "Резервная копия создана: $BACKUP_DIR/$FILENAME.tar.bz2"
