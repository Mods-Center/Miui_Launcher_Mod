REPLACE="
/system/priv-app/MILauncher
/system/priv-app/MiLauncher
/system/priv-app/MILauncherGlobal
/system/priv-app/MiLauncherGlobal
/system/priv-app/MiuiHome
/system/priv-app/MIUIHome
/system/priv-app/MiuiLauncherGlobal
/system/priv-app/MIUILauncherGlobal
/system/product/priv-app/MILauncher
/system/product/priv-app/MiLauncher
/system/product/priv-app/MILauncherGlobal
/system/product/priv-app/MiLauncherGlobal
/system/product/priv-app/MiuiHome
/system/product/priv-app/MIUIHome
/system/product/priv-app/MiuiHomeT
/system/product/priv-app/MIUIHomeT
/system/product/priv-app/MiuiLauncherGlobal
/system/product/priv-app/MIUILauncherGlobal
"

install_files() {
ui_print " READ!!! "
ui_print " Signature verification must be disabled"
ui_print " mandatory for MIUI 14 users based on" 
ui_print " Android 13; otherwise, the module will"
ui_print " not work. "
ui_print " "

Android=`getprop ro.build.version.release`

if [ $Android = 11 ]; then
    ui_print " "
    ui_print " Android 11 detected"
    ui_print " "
    cp -rf $MODPATH/files/launcher/MiuiHome.apk $MODPATH/system/priv-app/aMiuiHome
elif [ $Android = 12 ]; then
    ui_print " "
	ui_print " Android 12 detected"
    ui_print " "
    cp -rf $MODPATH/files/launcher/MiuiHome.apk $MODPATH/system/priv-app/aMiuiHome
    set_monet
elif [ $Android = 13 ]; then
    ui_print " "
	ui_print " Android 13 detected"
    ui_print " "
    cp -rf $MODPATH/files/launcher/MiuiHome.apk $MODPATH/system/product/priv-app/aMiuiHome
    set_monet
else
    ui_print " Version not supported"
    ui_print " Exiting..."
    exit
fi

ui_print "- Launcher updates will be uninstalled..."
    pm uninstall-system-updates com.miui.home

TMPAPKDIR=/data/local/tmp
cp -rf $MODPATH/files/launcher/MiuiHome.apk $TMPAPKDIR
result=$(pm install ${TMPAPKDIR}/MiuiHome.apk 2>&1)

if [ $result = Success ]; then
    ui_print " "
    ui_print " Signature verification disablement detected"
    ui_print " proceeding to install as an update."
    ui_print " Installed successfully."
    ui_print " "
else
    ui_print " "
    ui_print " Signature verification disablement not detected"
    ui_print " proceeding with normal installation."
    ui_print " Reboot is needed."
    ui_print " "
fi

}

set_monet() {
    . $MODPATH/addon/install.sh
ui_print " Do you want Monet colors?"
ui_print " "
ui_print "  Vol+ = Yes"
ui_print "  Vol- = No"
ui_print " "
if chooseport; then
    ui_print "- Monet added"
    ui_print " "
    cp -rf $MODPATH/files/MonetMiuiHome.apk $MODPATH/system/product/overlay
else
    ui_print "- Skipping"
    ui_print " "
fi
}

set_permissions() {
    su -c pm grant com.miui.home android.permission.READ_MEDIA_IMAGES
    set_perm_recursive  $MODPATH  0  0  0755  0644
}

cleanup() {
	rm -rf $MODPATH/addon 2>/dev/null
	rm -rf $MODPATH/files 2>/dev/null
	rm -f $MODPATH/install.sh 2>/dev/null
	ui_print "  - Deleting package cache files"
    rm -rf /data/resource-cache/*
    rm -rf /data/system/package_cache/*
    rm -rf /cache/*
    rm -rf /data/dalvik-cache/*
    ui_print "  - Deleting old module (if it is installed)"
    touch /data/adb/modules/miui_launcher_mod/remove
}

run_install() {
	unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
	ui_print " "
	ui_print " Installing files"
	install_files
	set_permissions
	sleep 1
	ui_print " "
	ui_print " Cleaning up"
	ui_print " "
	cleanup
	sleep 1
	ui_print " "
	ui_print "- Removing any Miui Launcher folder to avoid issues"
}

run_install