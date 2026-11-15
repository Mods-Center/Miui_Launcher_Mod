#!/system/bin/sh
# --- Mods Center: warn in the root manager if module files are not mounted ---
KASHI_MODDIR=${0%/*}
[ -f "$KASHI_MODDIR/kashi_mount_check.sh" ] && { MODDIR=$KASHI_MODDIR; . "$KASHI_MODDIR/kashi_mount_check.sh"; kashi_boot_check; } &
