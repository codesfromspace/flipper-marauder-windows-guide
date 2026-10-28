# Řešení problémů (Windows)

## „Device not found“ nebo žádný COM port

1. Zkontrolujte, že je deska připojena k Windows počítači datovým USB kabelem přímo do jejího konektoru.
2. Zkuste jiný kabel a USB port; nabíjecí kabel nemusí přenášet data.
3. Otevřete **Správce zařízení → Porty (COM a LPT)**. COM port se může objevit až po připojení nebo po přepnutí desky do BOOT módu.
4. Zopakujte BOOT postup: držte `BOOT`, připojte USB, stiskněte a uvolněte `RESET`, uvolněte `BOOT`.
5. Spusťte `detect_port.bat` znovu. Pokud Windows ukazuje jiné COM číslo po BOOTu, použijte aktuální port.
6. Ověřte instalaci správného ovladače podle USB rozhraní desky. CP210x ovladač je určen pro převodník Silicon Labs; není univerzálním ovladačem pro každé ESP32.

## Problémy s USB ovladačem

- Ve Správci zařízení zkontrolujte, zda zařízení není označeno žlutým vykřičníkem nebo jako neznámé.
- V **Vlastnosti → Podrobnosti → ID hardwaru** ověřte výrobce zařízení a podle toho hledejte odpovídající ovladač.
- CP210x: použijte [oficiální Silicon Labs VCP driver](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads). U jiného USB rozhraní vyhledejte ovladač u výrobce daného rozhraní.
- Po instalaci ovladače odpojte a znovu připojte desku; případně restartujte Windows.

## Chyby při flashování

- Zavřete jiné programy, které mohou používat COM port, například sériový monitor.
- Ověřte COM port příkazem `.\detect_port.bat` a spusťte `.\flash.bat COM5` s aktuálním číslem.
- Zkontrolujte BOOT postup a zkuste znovu datový kabel nebo jiný USB port.
- Neodpojujte zařízení během zápisu. Pokud proces skončí chybou, restartujte desku a spusťte flasher znovu.
- Ujistěte se, že jste v CMD/PowerShellu, nikoli Git Bash, a že jste dokončili `install.bat`.
- Pro konkrétní chybu a podporované verze nahlédněte do [upstream README a Issues](https://github.com/SkeletonMan03/FZEasyMarauderFlash).

## Flipper s deskou nekomunikuje

- Flashování ESP32 neinstaluje aplikaci do Flipperu. Nainstalujte/spusťte kompatibilní Marauder Companion aplikaci zvlášť.
- Zkontrolujte, že je deska správně a bez násilí nasazená na GPIO konektoru.
- Restartujte Flipper i desku a ověřte, že verze Companion aplikace odpovídá verzi firmwaru. Aktuální požadavky jsou v [ESP32 Marauder wiki](https://github.com/justcallmekoko/ESP32Marauder/wiki/Flipper-Zero).
- Nepřipojujte náhradní ESP32 desku podle odhadu. Ověřte její pinout, napěťové úrovně a zapojení TX/RX/GND v její dokumentaci.

## VS Code Remote Tunnel

- Terminál v okně Remote Tunnel běží na vzdáleném hostiteli, ne nutně na počítači, kde máte připojenou desku.
- Zkontrolujte Správce zařízení **na Windows hostiteli, kde běží terminál**. COM port z lokálního počítače se do vzdáleného systému automaticky nepřenáší.
- Pokud organizace používá samostatné USB/COM přesměrování, ověřte jeho nastavení a dostupnost portu v hostitelském Windows. Jinak připojte desku k hostiteli nebo spusťte instalaci lokálně.
- Vzdálená relace také potřebuje přístup k internetu pro klonování projektu a stažení závislostí.
