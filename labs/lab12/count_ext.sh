#!/bin/bash
# count_ext.sh --- подсчёт файлов указанного формата в каталоге
# Использование: ./count_ext.sh <формат> <каталог>

if [ $# -lt 2 ]; then
    echo "Использование: $0 <формат> <каталог>" >&2
    exit 1
fi

FORMAT="$1"
DIR="$2"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: $DIR не является каталогом" >&2
    exit 1
fi

count=0
for item in "$DIR"/*"$FORMAT"
do
    [ -f "$item" ] || continue
    count=$((count + 1))
done

echo "Файлов с форматом $FORMAT в $DIR: $count"
