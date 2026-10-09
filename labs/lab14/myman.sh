#!/bin/bash
# myman.sh --- упрощённый аналог man
# Использование: ./myman.sh <команда>

if [ $# -lt 1 ]; then
    echo "Использование: $0 <команда>" >&2
    exit 1
fi

CMD="$1"
MANDIR="/usr/share/man/man1"
FILE="$MANDIR/$CMD.1.gz"

if [ ! -f "$FILE" ]; then
    echo "Справка по команде '$CMD' не найдена в $MANDIR" >&2
    exit 1
fi

# Рендерим man-страницу через groff и листаем через less
zcat "$FILE" | groff -man -Tutf8 | less
