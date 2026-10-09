#!/bin/bash
# randletters.sh --- генератор случайных букв через $RANDOM
# Использование: ./randletters.sh <длина>

LEN="${1:-10}"
RESULT=""

for i in $(seq 1 "$LEN")
do
    # 0..25 → 97..122 → a..z
    code=$(( 97 + RANDOM % 26 ))
    # Преобразование кода в символ (через printf)
    ch=$(printf "\\$(printf '%03o' "$code")")
    RESULT="${RESULT}${ch}"
done

echo "$RESULT"
