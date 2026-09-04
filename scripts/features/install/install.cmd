:: Назначение: Устанавливает программы

set install_errors=0

winget install --id Zen-Team.Zen-Browser -e --silent
if errorlevel 1 (
    echo Не удалось установить Zen browser
    set /a install_errors+=1
)

winget install --id Discord.Discord -e --silent
if errorlevel 1 (
    echo Не удалось установить Discord
    set /a install_errors+=1
)

winget install --id Git.Git -e --silent
if errorlevel 1 (
    echo Не удалось установить Git
    set /a install_errors+=1
)

winget install --id Valve.Steam -e --silent
if errorlevel 1 (
    echo Не удалось установить Steam
    set /a install_errors+=1
)

winget install --id Telegram.TelegramDesktop -e --silent
if errorlevel 1 (
    echo Не удалось установить Telegram
    set /a install_errors+=1
)

winget install --id Microsoft.VisualStudioCode -e --silent
if errorlevel 1 (
    echo Не удалось установить VSC
    set /a install_errors+=1
)

winget install --id winget install Microsoft.DotNet.SDK.10 -e --silent
if errorlevel 1 (
    echo Не удалось установить SDK 10
    set /a install_errors+=1
)

winget install --id Python.Python.3.12 -e --silent
if errorlevel 1 (
    echo Не удалось установить Python 3.12
    set /a install_errors+=1
)

winget install --id Amnezia.AmneziaWG -e --silent
if errorlevel 1 (
    echo Не удалось установить AmneziaWG
    set /a install_errors+=1
)

:Exit
if %install_errors% GTR 0 (
    exit /b 1
) else (
    exit /b 0
)