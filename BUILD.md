# DS4Windows Build Instructions

## Prerequisites
- Windows 10/11 (x64)
- .NET 8.0 SDK
- ViGEmBus Driver (for full functionality)

## Quick Start
For automated build and publish process, use the included batch script:
```batch
publish.bat
```
This script will automatically build, publish, and create distribution packages for both x64 and x86 architectures, then clean up all temporary files.

## Build

### Build x64 Version
```
dotnet restore DS4WindowsWPF.sln
dotnet build DS4WindowsWPF.sln -c Release -p:Platform=x64
dotnet publish DS4WindowsWPF.sln -c Release -p:Platform=x64 --self-contained true -r win-x64
```

### Build x86 Version
```
dotnet restore DS4WindowsWPF.sln
dotnet build DS4WindowsWPF.sln -c Release -p:Platform=x86
dotnet publish DS4WindowsWPF.sln -c Release -p:Platform=x86 --self-contained true -r win-x86
```

## Publishing

### Publish x64 Distribution
```batch
mkdir DS4Windows_Distribution_x64
xcopy "DS4Windows\bin\x64\Release\net8.0-windows\win-x64\publish\*" DS4Windows_Distribution_x64\ /E /I /Y
powershell Compress-Archive -Path "DS4Windows_Distribution_x64\*" -DestinationPath "DS4Windows_v4.0.0_x64.zip" -Force
```

### Publish x86 Distribution
```batch
mkdir DS4Windows_Distribution_x86
xcopy "DS4Windows\bin\x86\Release\net8.0-windows\win-x86\publish\*" DS4Windows_Distribution_x86\ /E /I /Y
powershell Compress-Archive -Path "DS4Windows_Distribution_x86\*" -DestinationPath "DS4Windows_v4.0.0_x86.zip" -Force
```

## Cleanup

### Clean All Build Artifacts
```batch
rmdir /S /Q DS4Windows_Distribution_x64
rmdir /S /Q DS4Windows_Distribution_x86
rmdir /S /Q DS4Windows\bin\x64
rmdir /S /Q DS4Windows\bin\x86
```

## Running the Application

### From Build Directory
The executable can be run directly from the publish directory:
```
DS4Windows\bin\x64\Release\net8.0-windows\win-x64\publish\DS4Windows.exe
```

### From Distribution Package
After extracting the ZIP file, run:
```
DS4Windows.exe
```

**Note**: Make sure all required files (DLLs, config files) are in the same directory as the executable.

## Troubleshooting

### Application Won't Start
If the application doesn't start or shows no UI:

1. **Check Dependencies**: Ensure all DLL files are present in the same directory as DS4Windows.exe
2. **Run as Administrator**: Try running the executable as Administrator
3. **Check Windows Defender**: Windows Defender might block the application - add an exception
4. **Visual C++ Redistributable**: Install Visual C++ 2015-2022 Redistributable

### Missing Files
The publish directory should contain:
- DS4Windows.exe
- NLog.config
- Various .dll files
- Lang/ directory (if translations are included)

### Alternative Build Method
If self-contained build doesn't work, try framework-dependent build:
```
dotnet publish DS4WindowsWPF.sln -c Release -p:Platform=x64
```
This requires .NET 8.0 Runtime to be installed on the target machine.