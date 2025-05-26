# External Resources & Tools

## USB Drivers

- **MediaTek USB VCOM Drivers**  
  [Download](https://mega.nz/file/3h8BSY5J#0sfvyru6Hl6FsryUO2v9Yi1mmtsE4wrze68L4rjSGNk)

- **MediaTek Windows USB Drivers**  
  [https://mtkusbdriver.com/](https://mtkusbdriver.com/)

- **MediaTek CDC Drivers**  
  [Download](https://mega.nz/file/Y0gV1IiB#uvh5WU7rVxkZA_n20uE5T7UxdtbK2KNA0uXHk_Ts1ds)

- **USBDK (Alternative Framework)**  
  [Download](https://androidfilehost.com/?fid=14655340768118475369)

---

## Required Software

- **Python 3.9.17**  
  [Download](https://www.python.org/downloads/release/python-3917/)  
  ⚠️ *During installation, make sure to click on “Add Python to PATH”*

- **MTKClient (MediaTek Tool)**  
  [GitHub](https://github.com/bkerler/mtkclient)

---

## Setup Tips

- Enable **Developer Options**  
- Enable **OEM Unlock** and **USB Debugging** on the device

---

## Commands

```bash
# This will erase metadata, userdata, and md_udc (⚠️ all data will be lost)
python mtk.py e metadata,userdata,md_udc

# Unlock secure configuration
python mtk.py da seccfg unlock
```

For bootloader unlock:
```bash
fastboot reboot bootloader
fastboot flashing unlock
```

---

## Guides

- **MTK Unlock Reference Guide**  
  [https://www.hovatek.com/forum/thread-40300.html](https://www.hovatek.com/forum/thread-40300.html)

---

## Post-Root Apps

- **Aurora Store** — Alternative Play Store client  
- **FairEmail** — Gmail alternative  
- **Quillnote** — Notes app (alternative to Google Keep)  
- **Mull** — Privacy-focused browser  
- **Lawnchair 2** — Custom launcher  
- **ReVanced Manager** — YouTube & Music mod manager

---