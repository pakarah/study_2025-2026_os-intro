#!/bin/bash
# search.sh --- поиск строк в файле с ключами:
#   -i <файл>  --- читать данные (inputfile)
#   -o <файл>  --- писать результат (outputfile)
#   -p <шаблон> --- шаблон поиска
#   -C          --- различать большие и малые буквы
#   -n          --- выдавать номера строк

INPUT=""
OUTPUT=""
PATTERN=""
CASE_FLAG=""
LINE_NUM=""

while getopts "i:o:p:Cn" opt
do
    case $opt in
        i) INPUT="$OPTARG" ;;
        o) OUTPUT="$OPTARG" ;;
        p) PATTERN="$OPTARG" ;;
        C) CASE_FLAG="-i" ;;
        n) LINE_NUM="-n" ;;
        *) echo "Неверный ключ: -$opt" >&2; exit 1 ;;
    esac
done

if [ -z "$INPUT" ] || [ -z "$PATTERN" ]; then
    echo "Использование: $0 -i <вход> -p <шаблон> [-o <выход>] [-C] [-n]" >&2
    exit 1
fi

# Без -C — регистронезависимо (-i); с -C — регистрозависимо (по умолчанию grep)
if [ -z "$CASE_FLAG" ]; then
    GREP_OPTS="-i"
else
    GREP_OPTS=""
fi

if [ -n "$OUTPUT" ]; then
    grep $GREP_OPTS $LINE_NUM "$PATTERN" "$INPUT" > "$OUTPUT"
else
    grep $GREP_OPTS $LINE_NUM "$PATTERN" "$INPUT"
fi
