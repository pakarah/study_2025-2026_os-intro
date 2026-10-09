#!/bin/bash
# mkfiles.sh --- создаёт/удаляет N файлов 1.tmp … N.tmp
# Использование: $0 <N> <create|delete>

if [ $# -lt 2 ]; then
    echo "Использование: $0 <N> <create|delete>" >&2
    exit 1
fi

N="$1"
ACTION="$2"

case "$ACTION" in
    create)
        for i in $(seq 1 "$N")
        do
            touch "${i}.tmp"
            echo "Создан: ${i}.tmp"
        done
        ;;
    delete)
        for i in $(seq 1 "$N")
        do
            if [ -f "${i}.tmp" ]; then
                rm "${i}.tmp"
                echo "Удалён: ${i}.tmp"
            fi
        done
        ;;
    *)
        echo "Неверное действие: $ACTION" >&2
        exit 1
        ;;
esac
