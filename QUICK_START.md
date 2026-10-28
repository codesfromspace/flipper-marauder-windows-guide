# Rychlý start (Windows)

## Checklist

- [ ] WiFi Devboard ESP32-S2 a datový USB kabel
- [ ] Windows má Python 3 a Git (`py -3 --version`, `git --version`)
- [ ] Deska je připojená k Windows počítači, na kterém poběží terminál
- [ ] V této složce spusťte `install.bat`
- [ ] Spusťte `detect_port.bat` a poznamenejte si COM číslo
- [ ] BOOT mód: držte `BOOT` → připojte USB → stiskněte a uvolněte `RESET` → uvolněte `BOOT`
- [ ] Spusťte `flash.bat COM5` (nahraďte `COM5`) a vyberte **WiFi Devboard / ESP32-S2**
- [ ] Po úspěšném zápisu připojte desku k Flipperu a spusťte kompatibilní Marauder Companion aplikaci

## Kdy je hotovo?

Hotovo je, když flasher dokončí zápis bez chyby a Marauder Companion po připojení desky komunikuje s ESP32. Companion aplikaci je potřeba instalovat do Flipperu samostatně.

Podrobnosti: [README](README.md) · [Troubleshooting](TROUBLESHOOTING.md)
