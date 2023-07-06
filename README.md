# Modded MIUI Launcher
 
![Picsart_22-12-14_07-47-34-971](https://telegra.ph/file/479d8c1d24c2b5f2c7168.png)

MIUI Launcher App modified by [Kashi](https://t.me/kakashi1v1) with added features and UI changes.

### Prerequisites
- Rooted device using [Magisk latest stable](https://github.com/topjohnwu/Magisk/releases/latest).
- MIUI 13-14 based ROMs with Android 11 or higher.

### Changelog
- New UI interface.
- Added several new modifications.
- Fixed all bugs noticed in the previous update.

### Notes
- Tested on Global/CN/EU ROMs based on MIUI 13 - Android 12 and higher.
- Users with Global/CN ROMs based on Android 13 are required to disable signature verification, and it is recommended to use Core Patch LSPosed module.
- If you use this in your ROM, please remember to credit our work.
- Not for paid ROMs.
- For issues or questions, you can send a message to the [Telegram](https://t.me/amogus_discussion) group.

### Download
- Download from the [releases page](https://github.com/Mods-Center/Miui_Launcher_Mod/releases)

### Instructions
- Download the zip file and flash it in Magisk.
- Reboot your device.
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
![photo_2022-12-16_21-10-41](https://telegra.ph/file/f3785e7c0a9635e1cdfd7.png)
![photo_2022-12-16_21-10-37](https://telegra.ph/file/a1aad969d4acfc91b349f.png)
![photo_2022-12-16_21-10-31](https://telegra.ph/file/3437550f579f607362b24.png)
![photo_2022-12-16_21-10-53](https://telegra.ph/file/c94b2230c329bc8ed9ccc.png)
![photo_2022-12-16_21-10-49](https://telegra.ph/file/49c03d4f92af0e105022e.png)
![photo_2022-12-16_21-10-45](https://telegra.ph/file/e4a55ea339eb6249efbb7.png)

| Download Mods | Total |
| --- | --- |
| GitHub Releases | ![GitHub all releases](https://img.shields.io/github/downloads/Mods-Center/Miui_Launcher_Mod/total?logo=GitHub&style=for-the-badge&color=blue) |


