# Technické informace

## Cílová deska

Tento návod cílí na originální **Flipper Zero WiFi Devboard s ESP32-S2**. Upstream flasher uvádí také ESP32-S2 a další desky jako kompatibilní, ale firmware ani volbu desky nelze bez ověření zaměňovat. Před flashováním ověřte model a vyberte přesně odpovídající volbu.

## USB a BOOT mód

Deska připojuje ESP32-S2 k počítači přes USB. Windows může port zobrazit pod různými názvy podle USB rozhraní a ovladače. Při BOOT postupu deska vstoupí do režimu pro flashování; po zápisu ji restartujte běžným způsobem.

## Připojení k Flipperu a piny

Originální WiFi Devboard je určena k nasazení na GPIO konektor Flipperu; před připojením ověřte orientaci podle [oficiální dokumentace](https://docs.flipper.net/development/hardware/wifi-devboard). Nezkratujte piny a konektor nenasazujte násilím.

Pro jiné ESP32 desky vyžaduje sériová komunikace obvykle křížené UART signály a společnou zem:

| ESP32 deska | Flipper Zero |
|---|---|
| TX0 | RX |
| RX0 | TX |
| GND | GND |
| 3V3 | 3V3 |

Tato tabulka není univerzálním návodem k napájení ani pinoutu: ověřte napětí, směr signálu a zapojení v dokumentaci konkrétní desky. Nepřipojujte 5V na 3V3 pin.

## ESP32-S2

ESP32-S2 je 2,4GHz Wi-Fi SoC společnosti Espressif. Přesné parametry konkrétního modulu se mohou lišit; technické specifikace a dokumentace jsou v [ESP32-S2 datasheetu](https://www.espressif.com/sites/default/files/documentation/esp32-s2_datasheet_en.pdf) a [ESP-IDF dokumentaci](https://docs.espressif.com/projects/esp-idf/en/stable/esp32s2/).

## Ověřené zdroje a kompatibilita

- [FZEasyMarauderFlash README — kompatibilní desky a postup](https://github.com/SkeletonMan03/FZEasyMarauderFlash)
- [ESP32 Marauder Wiki](https://github.com/justcallmekoko/ESP32Marauder/wiki)
- [Flipper Zero WiFi Devboard dokumentace](https://docs.flipper.net/development/hardware/wifi-devboard)
- [Silicon Labs CP210x VCP ovladače](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads)
