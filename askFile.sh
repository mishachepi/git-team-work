#!/bin/bash

# Запрос расширения у пользователя
read -p "Введите расширение файлов (например, txt, jpg): " extension

# Проверка ввода
if [[ -z "$extension" ]]; then
    echo "Ошибка: Вы не ввели расширение!"
    exit 1
fi

# Пути к папкам
#SOURCE_DIR="./source"  # Папка, из которой копируем
SOURCE_DIR="D:\it hub\linux\git\git-team-work\source"
TARGET_DIR="D:\it hub\linux\git\git-team-work\target"  # Папка, в которую копируем

# Создаем  если её нет/# Папка, из которой копируем
mkdir -p "$SOURCE_DIR"

# Создаемпапку, если её нет/ # Папка, в которую копируем
mkdir -p "$TARGET_DIR"

# Копируем файлы с указанным расширением
files_copied=0
for file in "$SOURCE_DIR"/*."$extension"; do
    if [[ -f "$file" ]]; then
        cp "$file" "$TARGET_DIR"
        echo "Файл $(basename "$file") скопирован в $TARGET_DIR"
        ((files_copied++))
    fi
done

# Проверяем, были ли файлы для копирования
if [[ $files_copied -eq 0 ]]; then
    echo "Файлы с расширением .$extension не найдены в $SOURCE_DIR."
else
    echo "Всего скопировано файлов: $files_copied"
fi
