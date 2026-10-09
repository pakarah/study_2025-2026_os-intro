#!/bin/bash
# semaphore.sh --- упрощённый механизм семафоров
# Использование: ./semaphore.sh <имя_процесса> <t1> <t2>
#   t1 --- максимальное время ожидания ресурса (сек)
#   t2 --- время использования ресурса (сек), t2 < t1

NAME="${1:-process}"
T1="${2:-10}"
T2="${3:-3}"
LOCKFILE="/tmp/semaphore.lock"

echo "[$NAME] Старт: ожидаю ресурс (до ${T1}с)"

# Ожидание освобождения ресурса
waited=0
while [ -f "$LOCKFILE" ] && [ "$waited" -lt "$T1" ]
do
    echo "[$NAME] Ресурс занят. Жду... (${waited}/${T1}с)"
    sleep 1
    waited=$((waited + 1))
done

if [ -f "$LOCKFILE" ]; then
    echo "[$NAME] Не дождался ресурса за ${T1}с. Выход."
    exit 1
fi

# Захват ресурса
touch "$LOCKFILE"
echo "[$NAME] Ресурс захвачен. Использую ${T2}с."
sleep "$T2"

# Освобождение ресурса
rm -f "$LOCKFILE"
echo "[$NAME] Ресурс освобождён."
