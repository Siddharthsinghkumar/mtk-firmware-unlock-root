# mtk-firmware-unlock-root

**Python-based toolchain to unlock MediaTek Android tablet bootloader, extract stock firmware, flash custom TWRP recovery, and apply Magisk root**

---

## Table of Contents

* [Project Overview](#project-overview)
* [Prerequisites](#prerequisites)
* [Installation & Setup](#installation--setup)
* [Usage](#usage)
* [Resources & References](#resources--references)
* [Workflow Diagram](#workflow-diagram)
* [Scripts](#scripts)
* [License](#license)

---

## Project Overview

Government-issued MediaTek tablets often ship with locked bootloaders, restricted firmware, and disabled developer options. This proof-of-concept demonstrates how to:

1. Communicate with the MTK BootROM via Python
2. Unlock and dump stock firmware partitions
3. Compile and flash a custom TWRP recovery
4. Apply a Magisk root patch

---

## Prerequisites

* **Host OS:** Windows 11 (tested)
* **Python:** 3.9.x (**avoid 3.10+**)
* **Tools:** `adb`, `fastboot`, `pyusb` (Docker optional)

### USB Drivers for Windows

1. **MediaTek USB VCOM Drivers**: [Download](https://mega.nz/file/3h8BSY5J#0sfvyru6Hl6FsryUO2v9Yi1mmtsE4wrze68L4rjSGNk)
2. **MediaTek Windows USB Drivers**: [mtkusbdriver.com](https://mtkusbdriver.com/)
3. **MediaTek CDC Drivers**: [Download](https://mega.nz/file/Y0gV1IiB#uvh5WU7rVxkZA_n20uE5T7UxdtbK2KNA0uXHk_Ts1ds)
4. **USBDK (alternative framework)**: [AndroidFileHost](https://androidfilehost.com/?fid=14655340768118475369)

---

## Installation & Setup

1. **Install USB Drivers** (from the links above).

2. **Install Python 3.9.x**, ensuring **Add Python to PATH** is checked during setup.

3. **Verify pip**:

   ```powershell
   pip --version
   ```

4. **Download MTKClient**:

   * Clone or download [bkerler/mtkclient](https://github.com/bkerler/mtkclient)
   * Extract the folder to a known location

5. **Open Command Prompt in the MTKClient folder**:

   * In File Explorer, navigate to the MTKClient folder
   * Type `cmd` in the address bar and press Enter

6. **Install Python dependencies**:

   ```powershell
   pip install -r requirements.txt
   ```

---

## Usage

### Step 1: Unlock Bootloader & Enter BROM Mode

1. Power off your tablet completely.

2. Open Command Prompt inside the MTKClient folder.

3. Run the following command to erase key partitions:

   ```powershell
   python mtk.py e metadata,userdata,md_udc
   ```

   ⚠️ **Warning:** This command **wipes all data** on the device, including apps, user files, and settings. Make sure to back up anything important before proceeding.

4. Enter BROM mode:

   * Press and hold **Volume Up + Volume Down + Power**
   * While holding, **connect the USB cable**
   * The device should be automatically detected

5. Unlock the secure config for rooting:

   ```powershell
   python mtk.py da seccfg unlock
   ```

---

### Step 2: Extract Stock ROM

Run the extraction script to dump `system.img`, `boot.img`, and other partitions:

```powershell
scripts\extract_rom.bat
```

---

### Step 3: Flash Custom Recovery & Magisk

1. Build and patch recovery with Magisk:

   ```powershell
   scripts\patch_recovery.bat
   ```

2. Flash the custom recovery and reboot:

   ```powershell
   fastboot flash recovery recovery\custom-recovery.img
   fastboot reboot
   ```

---

## Resources & References

* **Hovatek MTK Unlock Guide** (command reference):
  [https://www.hovatek.com/forum/thread-40300.html](https://www.hovatek.com/forum/thread-40300.html)
* **MTKClient** (Python MediaTek tool):
  [https://github.com/bkerler/mtkclient](https://github.com/bkerler/mtkclient)
* **Universal Android Debloater** (post-root cleanup):
  [https://github.com/0x192/universal-android-debloater](https://github.com/0x192/universal-android-debloater)

---

## Workflow Diagram

![Workflow](docs/workflow_diagram.png)

---

## Scripts

* `scripts/mediatek_comm.py` — Python tool for BootROM communication and partition unlocking
* `scripts/extract_rom.bat` — Batch script to dump `system.img`, `boot.img`, and other partitions via `adb`/`fastboot`

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
