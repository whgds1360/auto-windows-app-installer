:: Назначение: Проверяет доступность программ в репозитории

set not_found=0

call :Check "Zen-Team.Zen-Browser" "Zen Browser"
call :Check "Discord.Discord" "Discord"
call :Check "Git.Git" "Git"
call :Check "Valve.Steam" "Steam"
call :Check "Telegram.TelegramDesktop" "Telegram"
call :Check "Microsoft.VisualStudioCode" "VS Code"
call :Check "Microsoft.DotNet.SDK.10" "Microsoft.DotNet.SDK.10"
call :Check "Python.Python.3.12" "Python 3.12"
call :Check "Amnezia.AmneziaWG" "AmneziaWG"

echo Напоминаю Nvidia App, Minibin и Windhawk качаешь сам!
echo.

goto :Exit

:Check
winget search --id %1 >nul 2>&1
if "%errorlevel%"=="0" (
    echo [✅] %2 - Есть в репо
) else (
    set /a not_found+=1
    echo [❌] %2 - Не найдено
)
exit /b 0

:Exit
if %not_found% GTR 0 (
    exit /b 1
) else (
    exit /b 0
)