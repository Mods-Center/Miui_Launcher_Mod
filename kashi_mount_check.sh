#!/system/bin/sh
# kashi_mount_check.sh - Mods Center helper for modules that ship files under system/
#
# KernelSU 3.0+ (and forks that follow it) and APatch no longer mount module
# files by themselves: a "metamodule" (meta-overlayfs, Hybrid Mount, Mountify,
# magic mount...) must be installed. Magisk always mounts, so it is skipped.
#
# Install time (customize.sh):   . "$MODPATH/kashi_mount_check.sh"; kashi_install_check
# Boot time    (service.sh):     . "$MODDIR/kashi_mount_check.sh";  kashi_boot_check
#
# KASHI_STRICT=1 before kashi_install_check aborts instead of warning.

KASHI_META_HELP="Install a mount metamodule first (meta-overlayfs, Hybrid Mount, Mountify, magic mount...), reboot, then flash this again."

# Running under KernelSU / APatch (env vars are not always passed through installers)
kashi_is_ksu_like() {
  [ "$KSU" = "true" ] || [ "$APATCH" = "true" ] && return 0
  [ -d /data/adb/magisk ] && return 1
  [ -f /data/adb/ksud ] || [ -f /data/adb/apd ]
}

# Echo the id of an enabled metamodule. Every metamodule declares
# metamodule=1 (or true) in module.prop - the root manager itself relies on it -
# so this finds any mount module, whatever its name or mount method.
kashi_find_meta() {
  for kashi_d in /data/adb/modules_update/* /data/adb/modules/*; do
    [ -f "$kashi_d/module.prop" ] || continue
    [ -f "$kashi_d/disable" ] && continue
    [ -f "$kashi_d/remove" ] && continue
    if grep -qiE '^metamodule=(1|true)[[:space:]]*$' "$kashi_d/module.prop" 2>/dev/null; then
      echo "${kashi_d##*/}"
      return 0
    fi
  done
  return 1
}

# True if this root needs a metamodule to mount system/.
# Only builds whose ksud/apd knows about metamodules dropped the built-in mount;
# forks that still mount on their own never mention it.
kashi_needs_meta() {
  kashi_is_ksu_like || return 1
  for kashi_b in /data/adb/ksud /data/adb/ksu/bin/ksud /data/adb/apd; do
    [ -f "$kashi_b" ] && grep -q metamodule "$kashi_b" 2>/dev/null && return 0
  done
  return 1
}

kashi_install_check() {
  kashi_needs_meta || return 0
  kashi_meta=$(kashi_find_meta)
  if [ -n "$kashi_meta" ]; then
    ui_print "- Mount metamodule found: $kashi_meta"
    return 0
  fi
  ui_print " "
  ui_print "! WARNING: no mount metamodule installed"
  ui_print "! Your root does not mount module files by itself,"
  ui_print "! so this module will do NOTHING without one."
  ui_print "! $KASHI_META_HELP"
  ui_print " "
  [ "$KASHI_STRICT" = "1" ] && abort "! Aborting install"
  return 0
}

# Checks that shipped files are really in place (works with any mount method).
# If not, the module description in the root manager shows a warning.
kashi_boot_check() {
  [ -d "$MODDIR/system" ] || return 0
  kashi_is_ksu_like || return 0
  until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
  kashi_prop="$MODDIR/module.prop"
  [ -f "$kashi_prop.orig" ] || cp -f "$kashi_prop" "$kashi_prop.orig"
  kashi_ok=0 kashi_n=0
  for kashi_f in $(cd "$MODDIR/system" && find app priv-app framework overlay product system_ext vendor odm \
      -type f \( -name '*.apk' -o -name '*.jar' \) 2>/dev/null | head -n 5); do
    kashi_n=$((kashi_n + 1))
    cmp -s "$MODDIR/system/$kashi_f" "/system/$kashi_f" && { kashi_ok=1; break; }
  done
  if [ "$kashi_n" -gt 0 ] && [ "$kashi_ok" = "0" ]; then
    kashi_desc="NOT ACTIVE: files are not mounted. $KASHI_META_HELP"
    sed "s|^description=.*|description=⚠ $kashi_desc|" "$kashi_prop.orig" > "$kashi_prop"
  else
    cp -f "$kashi_prop.orig" "$kashi_prop"
  fi
  return 0
}
