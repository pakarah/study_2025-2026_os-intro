#!/bin/bash
# backup_dir.sh --- упаковка каталога в архив
# Использование: $0 <каталог> <архив.tar.gz> [-recent]

if [ $# -lt 2 ]; then
    echo "Использование: $0 <каталог> <архив> [-recent]" >&2
    exit 1
fi

DIR="$1"
ARCHIVE="$2"
RECENT="$3"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: $DIR не является каталогом" >&2
    exit 1
fi

if [ "$RECENT" = "-recent" ]; then
    # файлы, изменённые менее 7 дней назад
    find "$DIR" -type f -mtime -7 -print0 | \
        tar --null -czf "$ARCHIVE" --files-from=-
    echo "Упакованы файлы за последнюю неделю в $ARCHIVE"
else
    # весь каталог целиком
    tar -czf "$ARCHIVE" -C "$(dirname "$DIR")" "$(basename "$DIR")"
    echo "Упакован каталог $DIR в $ARCHIVE"
fi
