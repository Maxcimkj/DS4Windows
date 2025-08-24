@echo off
echo Starting DS4Windows Build and Publish Process...
echo.

REM Read version from version.txt
for /f "tokens=*" %%i in (DS4Windows\version.txt) do set VERSION=%%i
set VERSION=%VERSION: =%
echo Using version: %VERSION%
echo.

echo Step 1: Cleaning up previous build artifacts...
echo Cleaning up distribution directories...
if exist DS4Windows_Distribution_x64 rmdir /S /Q DS4Windows_Distribution_x64
if exist DS4Windows_Distribution_x86 rmdir /S /Q DS4Windows_Distribution_x86

echo Cleaning up build directories...
if exist DS4Windows\bin\x64 rmdir /S /Q DS4Windows\bin\x64
if exist DS4Windows\bin\x86 rmdir /S /Q DS4Windows\bin\x86

echo Cleaning up previous ZIP files...
if exist DS4Windows_v*_x64.zip del DS4Windows_v*_x64.zip
if exist DS4Windows_v*_x86.zip del DS4Windows_v*_x86.zip

echo Cleanup completed.
echo.

echo Step 2: Restoring dependencies...
dotnet restore DS4WindowsWPF.sln
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to restore dependencies
    pause
    exit /b 1
)

echo.
echo Step 3: Building x64 version...
dotnet build DS4WindowsWPF.sln -c Release -p:Platform=x64
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to build x64 version
    pause
    exit /b 1
)

echo.
echo Step 4: Publishing x64 version...
dotnet publish DS4WindowsWPF.sln -c Release -p:Platform=x64 --self-contained true -r win-x64
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to publish x64 version
    pause
    exit /b 1
)

echo.
echo Step 5: Building x86 version...
dotnet build DS4WindowsWPF.sln -c Release -p:Platform=x86
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to build x86 version
    pause
    exit /b 1
)

echo.
echo Step 6: Publishing x86 version...
dotnet publish DS4WindowsWPF.sln -c Release -p:Platform=x86 --self-contained true -r win-x86
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to publish x86 version
    pause
    exit /b 1
)

echo.
echo Step 7: Creating x64 distribution package...
mkdir DS4Windows_Distribution_x64
xcopy "DS4Windows\bin\x64\Release\net8.0-windows\win-x64\publish\*" DS4Windows_Distribution_x64\ /E /I /Y
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to copy x64 files
    pause
    exit /b 1
)

powershell Compress-Archive -Path "DS4Windows_Distribution_x64\*" -DestinationPath "DS4Windows_v%VERSION%_x64.zip" -Force
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create x64 ZIP file
    pause
    exit /b 1
)

echo.
echo Step 8: Creating x86 distribution package...
mkdir DS4Windows_Distribution_x86
xcopy "DS4Windows\bin\x86\Release\net8.0-windows\win-x86\publish\*" DS4Windows_Distribution_x86\ /E /I /Y
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to copy x86 files
    pause
    exit /b 1
)

powershell Compress-Archive -Path "DS4Windows_Distribution_x86\*" -DestinationPath "DS4Windows_v%VERSION%_x86.zip" -Force
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create x86 ZIP file
    pause
    exit /b 1
)

echo.
echo Step 9: Cleaning up build artifacts...
rmdir /S /Q DS4Windows_Distribution_x64
rmdir /S /Q DS4Windows_Distribution_x86
rmdir /S /Q DS4Windows\bin\x64
rmdir /S /Q DS4Windows\bin\x86

echo.
echo Build and publish process completed successfully!
echo Created files:
echo - DS4Windows_v%VERSION%_x64.zip
echo - DS4Windows_v%VERSION%_x86.zip
echo.
echo All temporary directories and build artifacts have been cleaned up.
pause
