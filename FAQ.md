# FAQ

## Co se stane po instalaci?

Na WiFi Devboard se zapíše ESP32 Marauder firmware. Samotné flashování nemění firmware Flipperu a neinstaluje do něj Companion aplikaci. Desku nasaďte na GPIO a spusťte kompatibilní aplikaci na Flipperu.

## Musím instalovat ovladač CP210x?

Ne vždy. Záleží na USB rozhraní konkrétní desky. Pokud jde o převodník CP210x, použijte ovladač Silicon Labs; jinak použijte ovladač odpovídající hardwaru. Ve Správci zařízení zkontrolujte stav a ID hardwaru.

## Jak zjistím COM port?

Spusťte `detect_port.bat` nebo otevřete Správce zařízení → **Porty (COM a LPT)**. Pokud se po BOOT postupu číslo změní, použijte nové číslo.

## Lze použít VS Code Remote Tunnel?

Ano, pokud je deska dostupná na Windows počítači, na kterém běží terminál. Tunnel sám USB zařízení nepředává. Viz [Remote Tunnel troubleshooting](TROUBLESHOOTING.md#vs-code-remote-tunnel).

## Jak aktualizovat firmware?

Ve složce průvodce spusťte `install.bat`, aby se do místního prostředí doinstalovaly případné nové závislosti. Pak aktualizujte checkout upstream projektu a znovu spusťte flasher:

```powershell
git -C .\tools\FZEasyMarauderFlash pull
.\install.bat
.\flash.bat COM5
```

V nabídce vyberte Marauder pro WiFi Devboard/ESP32-S2. Aktualizace firmwaru přepíše firmware ESP32; postupujte podle aktuálního upstream návodu a během zápisu desku neodpojujte.

## Instalace balíčků selhává

Ověřte `py -3 --version`, internetové připojení a oprávnění k zápisu do složky. `install.bat` používá vlastní `.venv`, takže nepotřebuje instalovat balíčky globálně. Další kroky jsou v [Troubleshooting](TROUBLESHOOTING.md).

## Funguje návod pro ESP32-WROOM nebo ESP32-S3?

Ne automaticky. Tento průvodce cílí na WiFi Devboard / ESP32-S2. Jiné desky mají jiné volby firmwaru, USB ovladače i zapojení; ověřte kompatibilitu v [FZEasyMarauderFlash](https://github.com/SkeletonMan03/FZEasyMarauderFlash).

## Kde najdu oficiální informace?

- [FZEasyMarauderFlash](https://github.com/SkeletonMan03/FZEasyMarauderFlash)
- [ESP32 Marauder wiki](https://github.com/justcallmekoko/ESP32Marauder/wiki)
- [Flipper Zero WiFi Devboard](https://docs.flipper.net/development/hardware/wifi-devboard)
