#!/bin/sh

/usr/bin/rclone copy /home/john/Documents/gnucash/finances.gnucash /mnt/rpi5/Documents/gnucash

(
    SRC="/home/john/.config/mozilla/firefox/mz3wi842.default-release/bookmarks.html"
    DST_DIR="/mnt/rpi5/Documents/backup/Firefox"
    DST="$DST_DIR/bookmarks.html"

    # Using return instead of exit if inside a function,
    # but inside these parentheses, exit only stops this subshell.
    [[ -f "$SRC" ]] || exit 0
    [[ -d "$DST_DIR" ]] || exit 0

    NEW_CONTENT=$(sed -E 's/\s(ICON|ICON_URI)="[^"]*"//g' "$SRC")

    if [[ "$NEW_CONTENT" != "$(cat "$DST" 2>/dev/null)" ]]; then
        echo "$NEW_CONTENT" > "$DST"
    fi
)
