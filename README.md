# Modded MIUI Launcher
 
![Picsart_22-12-14_07-47-34-971](https://telegra.ph/file/72c57aba7fc39d95a1e27.png)

MIUI Launcher App modified by [Kashi](https://t.me/kakashi1v1) with many features added and ui changes.

### Prerequisites
- Device rooted by [Magisk latest stable](https://github.com/topjohnwu/Magisk/releases/latest).
- MIUI 12-13 based ROMs with Android 10 or higher

### Changelog
- New user interface
- Changes in user interface
- Implemented more functions
- Can choose between iOS and Default for recent tasks
- Folder size unlocked for versions lower than MIUI 14
- Monet enabled
- Fixed loading screen for lots of users
- Blur folder bug fix and rounded folder for roms below than A12
- More ...........

### Notes
- Tested on Global/Cn/Eu ROMs based on MIUI 13 - Android 12
- Miui 14 Cn users need to install core patch lsposed and extract apk to install, Eu users can flash the module simply
- If you use this Launcher on your custom rom don't forget to give credits for the effort
- For issues or questions you can send a message in [Telegram](https://t.me/amogus_discussion) group.

### Download
- Download from [releases page](https://github.com/Mods-Center/Miui_Launcher_Mod/releases)

### Instructions
- Download zip and flash in Magisk
- Reboot your device
- Enjoy!

## Building from source

### For Ubuntu, Debian, and other Linux distributions
- Clone the repo using git.
```sh
git clone --depth=1 https://github.com/Mods-Center/Miui_Launcher_Mod
```
- Navigate to the **Miui_Launcher_Mod** folder.
```sh
cd Miui_Launcher_Mod
```
- Run autobuild.sh.
```sh
bash autobuild.sh
```
- Use below command to update repo if you have already cloned it before.
```sh
git pull
```

> The required zip package install command is in the script itself. However, if you encounter any errors, you need install **zip** utility manually.

### For Termux
- Open Termux, copy & paste this command:
```sh
termux-setup-storage
```
and give Termux storage access. If you get this warning "It appears that directory '~/storage' already exists. This script is going to rebuild its structure from scratch, wiping all dangling files. The actual storage content is not going to be deleted" then just do press "y". It won't do any harm to your device.
- Now copy & paste this command:
```sh
pkg upgrade || true
pkg install -y git
rm -rf Miui_Launcher_Mod
git clone --depth=1 https://github.com/Mods-Center/Miui_Launcher_Mod
cd Miui_Launcher_Mod
bash autobuild.sh
mv MIUI\ Launcher\ MOD* /sdcard
echo "Your magisk module is available in Internal Storage"
```
- Please make sure to grant storage permissions, if Termux asks you to do so, you will get Magisk module in your internal storage.
- Choose Offline Installer, Online Installer or Customize Installer using number keys.
- Use [Termux From F-Droid](https://f-droid.org/en/packages/com.termux/) to perform these tasks.
- The required zip package install command is in the script itself. However, if you encounter any errors, you can install **zip** manually. Use the following command to do so."
```sh
pkg install zip
```
- Use below command to update repo if you have already cloned it before.
```sh
cd Miui_Launcher_Mod
git pull
```

### Screenshots ###
![photo_2022-12-16_21-10-41](https://telegra.ph/file/171a778ecc6d9ecb0d92a.png)
![photo_2022-12-16_21-10-37](https://telegra.ph/file/83ab4240b157089f7ac9c.png)
![photo_2022-12-16_21-10-31](https://telegra.ph/file/a7eeca73de1fc547fd5b5.png)
![photo_2022-12-16_21-10-53](https://telegra.ph/file/4747a85c7f22a5c0f76dd.png)
![photo_2022-12-16_21-10-49](https://telegra.ph/file/ae49add564eba33723a62.png)
![photo_2022-12-16_21-10-45](https://telegra.ph/file/a151a94a9b55e23725a20.png)

| Download Mods | Total |
| --- | --- |
| GitHub Releases | ![GitHub all releases](https://img.shields.io/github/downloads/Mods-Center/Miui_Launcher_Mod/total?logo=GitHub&style=for-the-badge&color=blue) |


