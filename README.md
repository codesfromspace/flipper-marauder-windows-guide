# ESP32 Marauder na Flipper Zero WiFi Devboard — Windows

Návod pro flashování firmwaru ESP32 Marauder na originální WiFi Devboard pro Flipper Zero (ESP32-S2) pomocí projektu [FZEasyMarauderFlash](https://github.com/SkeletonMan03/FZEasyMarauderFlash). Počítá s Windows 10/11, VS Code a případně VS Code Remote Tunnel.

> Používejte Marauder pouze na vlastním zařízení a sítích nebo s výslovným souhlasem jejich vlastníka. Tento návod popisuje instalaci firmwaru, ne testování cizích sítí.

## Co budete potřebovat

- Flipper Zero a WiFi Devboard pro Flipper Zero.
- Windows 10/11, připojení k internetu a datový USB kabel.
- Python 3 a Git for Windows. Ověříte v CMD nebo PowerShellu:
  ```powershell
  py -3 --version
  git --version
  ```
- Pokud Windows zařízení nerozpozná, ovladač odpovídající USB rozhraní desky. Ovladač [Silicon Labs CP210x](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads) instalujte jen tehdy, pokud deska používá převodník CP210x.

Nejjednodušší je použít **CMD nebo PowerShell**. Upstream projekt nedoporučuje Git Bash pro flashování ve Windows.

## Instalace krok za krokem

### 1. Otevřete tuto složku ve VS Code

Otevřete složku průvodce přes **File → Open Folder**. V integrovaném terminálu (**Terminal → New Terminal**) zkontrolujte, že běží Windows CMD nebo PowerShell, ne terminál vzdáleného Linuxu/macOS.

### 2. Nainstalujte nástroje a Python balíčky

V Průzkumníku souborů otevřete tuto složku a spusťte `install.bat`, případně v terminálu:

```powershell
.\install.bat
```

Skript stáhne FZEasyMarauderFlash do `tools\FZEasyMarauderFlash`, vytvoří v něm izolované Python prostředí `.venv` a nainstaluje balíčky z upstream `requirements.txt`. Python a Git musí být nainstalované předem. Skript existující checkout automaticky neaktualizuje.

### 3. Připojte desku a zjistěte COM port

Připojte WiFi Devboard datovým USB kabelem **přímo k Windows počítači**. Spusťte `detect_port.bat` nebo použijte:

```powershell
.\detect_port.bat
```

Pro ruční kontrolu stiskněte `Win + X` → **Správce zařízení** → **Porty (COM a LPT)**. Poznamenejte si port, například `COM5`. Název zařízení se může lišit; důležité je číslo COM. Pokud se položka nezobrazí, zkuste jiné USB připojení a postup v [Troubleshooting](TROUBLESHOOTING.md).

### 4. Uveďte WiFi Devboard do BOOT módu

Připojujte USB do konektoru **na WiFi Devboardu**, ne do Flipperu. Proveďte pořadí podle upstream návodu:

1. Odpojte USB od desky.
2. Stiskněte a držte `BOOT`.
3. Zatímco držíte `BOOT`, připojte USB k počítači.
4. Stiskněte a uvolněte `RESET`.
5. Uvolněte `BOOT`.

Pokud se port změní, použijte nově zobrazený COM port. Když deska po flashování nerestartuje sama, stiskněte `RESET`.

### 5. Spusťte flashování

Zadejte port z předchozího kroku (nahraďte `COM5` svým portem):

```powershell
.\flash.bat COM5
```

Pokud chcete nejprve zkusit automatickou detekci flasheru:

```powershell
.\flash.bat
```

V nabídce upstream programu vyberte **Flash Marauder on WiFi Devboard or ESP32-S2** (obvykle volba `1`) a potvrďte. Během zápisu neodpojujte desku. Konkrétní volby i dostupnost firmwaru se mohou změnit; řiďte se aktuální nabídkou a README upstream projektu.

V **CMD** spusťte stejné skripty bez prefixu `.\`: `install.bat`, `detect_port.bat` a po BOOT postupu například `flash.bat COM5`. V **PowerShellu** použijte `.\install.bat`, `.\detect_port.bat` a `.\flash.bat COM5`.

### 6. Ověřte instalaci a připojte desku k Flipperu

1. Počkejte na úspěšné dokončení zápisu bez chyb. Odpojte USB a opusťte BOOT mód běžným restartem desky.
2. Nasaďte WiFi Devboard na GPIO konektor Flipperu ve správné orientaci. Nepoužívejte sílu.
3. Spusťte na Flipperu kompatibilní aplikaci **Marauder Companion**. Firmware na ESP32 a aplikace v Flipperu jsou dvě samostatné části; aplikace se tímto flashováním do Flipperu neinstaluje.
4. Úspěšné ověření: ESP32 se spustí a Companion komunikuje s deskou místo hlášení o chybějícím zařízení. Při problému zkontrolujte kompatibilitu verze aplikace a firmwaru.

## VS Code Remote Tunnel a USB

Remote Tunnel přenáší terminál a soubory na vzdálený počítač; **nepředává automaticky USB zařízení** z počítače, u kterého sedíte. Deska musí být připojená k Windows počítači, na kterém běží vzdálené VS Code prostředí. Jestli je připojená jen k lokálnímu počítači, vzdálený proces její COM port neuvidí bez samostatně nastaveného USB/COM přesměrování.

## Další informace

- [Řešení problémů](TROUBLESHOOTING.md)
- [Rychlý start](QUICK_START.md)
- [FAQ](FAQ.md)
- [Technické informace](TECHNICAL.md)
- [FZEasyMarauderFlash](https://github.com/SkeletonMan03/FZEasyMarauderFlash)
- [ESP32 Marauder a Flipper Zero wiki](https://github.com/justcallmekoko/ESP32Marauder/wiki)
- [Flipper Zero WiFi Devboard](https://docs.flipper.net/development/hardware/wifi-devboard)
- [Dokumentace ESP32-S2 (Espressif)](https://docs.espressif.com/projects/esp-idf/en/stable/esp32s2/)
