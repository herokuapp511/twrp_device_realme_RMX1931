# OrangeFox / TWRP Device configuration for realme X2 Pro (samurai / RMX1931)

Branch target: **Android 12–16 FBE** (including Android 16 / 16.2 QPR2 custom ROMs such as LineageOS 23).

## Features

Works:
- ADB
- Decryption of `/data` (FBE v2 + metadata encryption + wrappedkey)
- Screen brightness settings & notch alignment
- Correct screenshot color
- MTP
- Flashing (ROMs, images, Magisk, addons, etc.)
- Backup/Restore
- USB OTG
- Realme OZIP flashing support

## Android 16 decrypt notes

Tree is aligned with LOS 23 / A16 `fstab.qcom` for samurai:

- `TW_USE_FSCRYPT_POLICY := 2`
- `fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized,wrappedkey`
- `keydirectory=/metadata/vold/metadata_encryption`
- metadata crypto props (`dm-default-key`, format version 2)
- Keymaster 4.0 + Gatekeeper (same as A16 vendor for this device)

### After flashing a new ROM kernel

Update prebuilts from the ROM you want to decrypt:

```bash
# From ROM boot.img / dtbo.img
cp Image.gz-dtb device/realme/samurai/prebuilt/
cp dtbo.img device/realme/samurai/prebuilt/
```

If decrypt still fails, re-extract from the **vendor** partition of that ROM:

- `qseecomd`
- `android.hardware.keymaster@4.0-service-qti`
- `android.hardware.gatekeeper@1.0-service-qti`
- matching `vendor/lib64` deps

Then run `ldcheck` on `$OUT/recovery/root` after build.

---

## How to Build OrangeFox Recovery

### 1. Sync OrangeFox Manifest

```bash
mkdir -p ~/OrangeFox/fox_12.1
cd ~/OrangeFox/fox_12.1
repo init --depth=1 -u https://gitlab.com/OrangeFox/manifest.git -b fox_12.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone Device Tree

```bash
git clone https://github.com/herokuapp511/twrp_device_realme_RMX1931.git -b fox-12.1-stable device/realme/samurai
```

### 3. Build OrangeFox

```bash
source build/envsetup.sh
lunch fox_samurai-eng # or lunch twrp_samurai-eng / omni_samurai-eng
mka recoveryimage -j$(nproc --all) # or mka adbd recoveryimage
```

---

## How to Build TWRP

```bash
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c -j$(nproc --all)
git clone https://github.com/herokuapp511/twrp_device_realme_RMX1931.git -b fox-12.1-stable device/realme/samurai

source build/envsetup.sh
lunch twrp_samurai-eng
mka recoveryimage -j$(nproc --all)
```

---

## Testing & Installation

Test without flashing:

```bash
fastboot boot out/target/product/samurai/OrangeFox-*.img
# or
fastboot boot out/target/product/samurai/recovery.img
```

Flash when confirmed working:

```bash
fastboot flash recovery out/target/product/samurai/recovery.img
```

## Debug decrypt

`init.recovery.qcom.rc` enables:

- `prepdecrypt.setpatch=true`
- `prepdecrypt.loglevel=2`

Check `/tmp/recovery.log` or `adb shell cat /tmp/recovery.log` after boot.

