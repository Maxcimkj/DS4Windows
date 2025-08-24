# DS4Windows

Like those other DS4 tools, but sexier.

DS4Windows is an extract anywhere program that allows you to get the best
DualShock 4 experience on your PC. By emulating an Xbox 360 controller, many
more games are accessible. Other input controllers are also supported including the
DualSense, Switch Pro, and JoyCon controllers (**first party hardware only**).

This project is a fork of the work of [Ryochan7/DS4Windows](https://github.com/ryochan7/ds4windows/releases).

![DS4Windows Preview](https://raw.githubusercontent.com/Ryochan7/DS4Windows/jay/ds4winwpf_screen_20200412.png)

## What's New

### Touchpad Emulation Mode
DS4Windows now includes advanced **Touchpad Emulation** functionality that allows you to control virtual touchpad zones using mapped button actions. This feature is particularly useful for controllers without physical touchpads (Xbox 360, Xbox One, etc.).

**Available Virtual Controls:**
- **TouchLeft**: Maps to left side of touchpad (X: 320, Y: 235)
- **TouchpadClick**: Maps to center of touchpad (X: 960, Y: 471)  
- **TouchRight**: Maps to right side of touchpad (X: 1600, Y: 235)

**How It Works:**
- Physical touchpad is disabled in emulation mode
- Map buttons (Share, Options, etc.) to TouchLeft, TouchRight, or TouchpadClick actions
- Games receive proper touchpad input from mapped buttons
- Perfect for controllers without physical touchpads

## Installation

1. **Install .NET 8.0 Desktop Runtime**
   - [Download .NET 8.0 Desktop Runtime x64](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-8.0.0-windows-x64-installer)
   - [Download .NET 8.0 Desktop Runtime x86](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-8.0.0-windows-x86-installer)

2. **Install Visual C++ 2015-2022 Redistributable**
   - [Download Visual C++ 2015-2022 Redistributable x64](https://aka.ms/vs/17/release/vc_redist.x64.exe)
   - [Download Visual C++ 2015-2022 Redistributable x86](https://aka.ms/vs/17/release/vc_redist.x86.exe)

3. **Install ViGEmBus Driver**
   - [Download ViGEmBus Driver](https://vigem.org/)

4. **Download and Extract DS4Windows**
   - [Download latest release](https://github.com/Maxcimkj/DS4Windows/releases)
   - Extract the ZIP file to your preferred location
   - Run DS4Windows.exe

## Documentation

- **[User Guide](USERGUIDE.md)** - Complete usage instructions and feature documentation
- **[Build Instructions](BUILD.md)** - How to build and distribute DS4Windows

## Requirements

- Windows 10 or newer (Thanks Microsoft)
- Microsoft .NET 8.0 Desktop Runtime. [x64](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-8.0.0-windows-x64-installer) or [x86](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-8.0.0-windows-x86-installer)
- Visual C++ 2015-2022 Redistributable. [x64](https://aka.ms/vs/17/release/vc_redist.x64.exe) or [x86](https://aka.ms/vs/17/release/vc_redist.x86.exe)
- [ViGEmBus](https://vigem.org/) driver (DS4Windows will install it for you)
- **Sony** DualShock 4 or other supported controller
- Connection method:
  - Micro USB cable
  - [Sony Wireless Adapter](https://www.amazon.com/gp/product/B01KYVLKG2)
  - Bluetooth 4.0 (via an
  [adapter like this](https://www.newegg.com/Product/Product.aspx?Item=N82E16833166126)
  or built in pc). Only use of Microsoft BT stack is supported. CSR BT stack is
  confirmed to not work with the DS4 even though some CSR adapters work fine
  using Microsoft BT stack. Toshiba's adapters currently do not work.
  *Disabling 'Enable output data' in the controller profile settings might help with latency issues, but will disable lightbar and rumble support.*
- Disable **PlayStation Configuration Support** and
**Xbox Configuration Support** options in Steam

## License

DS4Windows is licensed under the terms of the GNU General Public License version 3 (GPL-3.0). This license ensures that the software remains free and open source, allowing users to use, modify, and distribute the software under the same license terms. You can find a copy of the terms and conditions of that license at [https://www.gnu.org/licenses/gpl-3.0.txt](https://www.gnu.org/licenses/gpl-3.0.txt).
