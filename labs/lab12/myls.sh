#!/bin/bash
# myls.sh --- аналог ls без использования ls и dir

DIR="${1:-.}"

if [ ! -d "$DIR" ]; then
    echo "Ошибка: $DIR не является каталогом" >&2
    exit 1
fi

for item in "$DIR"/* "$DIR"/.[!.]*
do
    [ -e "$item" ] || continue
    perms=$(stat -c "%A" "$item")
    name=$(basename "$item")

    if [ -d "$item" ]; then
        echo "$perms  $name/"
    else
        echo "$perms  $name"
    fi
done
