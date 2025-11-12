#!/bin/bash

# --- Настройки ---
# Путь к вашей папке с обоями
WALLPAPER_DIR="$HOME/wallpapers"
# Путь к файлу истории, чтобы не повторять обои
HISTORY_FILE="$HOME/.cache/swww-history"
# --- Конец настроек ---

# Проверяем, существует ли папка с обоями
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Папка с обоями не найдена: $WALLPAPER_DIR"
    exit 1
fi

# Проверяем, запущен ли swww-daemon
if ! pgrep -x "swww-daemon" > /dev/null; then
    echo "swww-daemon не запущен. Запускаем..."
    swww-daemon &
    sleep 1 # Даём демону немного времени на запуск
fi

WIDTH=1920
HEIGHT=1080

# Если файл истории не существует, создаём его
if [ ! -f "$HISTORY_FILE" ]; then
    touch "$HISTORY_FILE"
fi

# Получаем список уже использованных обоев из файла истории
USED_WALLPAPERS=$(cat "$HISTORY_FILE" | xargs)

# Находим все файлы обоев и исключаем те, что уже были использованы
NEW_WALLPAPERS=$(find "$WALLPAPER_DIR" -type f | grep -vFf "$HISTORY_FILE")

# Если список новых обоев пуст, значит, все обои уже были показаны.
# Очищаем историю, чтобы начать заново
if [ -z "$NEW_WALLPAPERS" ]; then
    echo "Все обои были показаны. Очищаем историю."
    > "$HISTORY_FILE"
    NEW_WALLPAPERS=$(find "$WALLPAPER_DIR" -type f)
fi

# Выбираем случайный файл из списка новых обоев
WALLPAPER=$(echo "$NEW_WALLPAPERS" | shuf -n 1)
matugen image "$WALLPAPER"
# Генерируем случайные координаты X и Y в пределах экрана
# Используем $RANDOM для кроссплатформенной совместимости
RAND_X=$(( RANDOM % WIDTH ))
RAND_Y=$(( RANDOM % HEIGHT ))

# Устанавливаем обои с эффектом круга, частотой 150 FPS и случайными координатами
swww img "$WALLPAPER" --transition-fps 150 --transition-step 255 --transition-duration 2 --transition-type grow --transition-pos "$RAND_X,$RAND_Y"


# Добавляем новые обои в историю
echo "$WALLPAPER" >> "$HISTORY_FILE"

# Удаляем самую старую запись из истории, если она превышает лимит
# Максимальное количество записей в истории
MAX_HISTORY=$(find "$WALLPAPER_DIR" -type f | wc -l)
if [ $(wc -l < "$HISTORY_FILE") -gt "$MAX_HISTORY" ]; then
    sed -i '1d' "$HISTORY_FILE"
fi


