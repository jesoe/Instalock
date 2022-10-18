# VALORANT Instalock
Instalocks selected agent.

### [DOWNLOAD HERE](https://github.com/jesoe/Instalock/releases/download/v1.0.0/Instalock.exe)

![](https://i.imgur.com/7Lq0j45.png)

## Installation
[Download](https://github.com/jesoe/Instalock/releases/download/v1.0.0/Instalock.exe) and drag the .exe into it's own folder.

## How to use
1. Run Instalock.
2. Select an agent via the dropdown menu.
3. Start a queue.
4. Press **F4** to toggle the script on.
5. After the agent is locked, press **F4** to toggle the script off.
6. Press **F9** to exit the script.

## How to configure for your resolution / available agents

After running for the first time, the following three files will be generated within the directory:

### [Lock Button.ini](Lock%20Button.ini) = Lock Button Coordinates (**X/Y**)

### [[X]Agent List.txt]([X]Agent%20List.txt) = Agent Portrait Coordinates (**X**)

### [[Y]Agent List.txt]([Y]Agent%20List.txt) = Agent Portrait Coordinates (**Y**)

You can use these files to configure the proper coordinates of agent portraits as well as alter them to work with your specific resolution.

### How to find coordinates
1. Take a screen shot of the agent selection screen.
2. Upload it to any image hosting site. [Imgur](https://imgur.com/upload), [Google](https://photos.google.com/), etc.
3. Copy/Paste the direct image URL [HERE](https://inkplant.com/tools/image-coordinates) and click 'Swap Image'.
4. Click on the locations of the image you need coordinates for and enter them where necessary in the generated files.

### Coordinate resolution presets
- [1080p](1080p.txt)

## Compiling (Optional)
If you would like to compile the script yourself, follow this step by step.

1. Install [AHK](https://www.autohotkey.com/download/)
2. Download/Clone the [github repository](https://github.com/jesoe/Instalock)
6. Compile `Instalock.ahk` using Ahk2Exe with Unicode 32-bit.bin + MPRESS.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[![forthebadge](https://forthebadge.com/images/badges/ctrl-c-ctrl-v.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

> Forked from [Agent Picker](https://github.com/pintoso/Agent-Picker) based on the [Overwatch Hero Picker](https://github.com/Robert-K/overwatch-hero-picker/)