@echo off
chcp 65001 >nul

:: ========================================================
:: МОЙ ШЕДЕВРО СКРИПТ ДЛЯ ОБЛЕГЧЕНИЯ ЖИЗНИ                |
:: ========================================================
:: Назначение: Автоматическая установка набора программ   |
::              через Windows Package Manager (winget)    |
::              и их автоматическая настройка (в будущем  |
:: Автор:      whgds1360                                  |
:: ========================================================
:: Описание:                                              |
::   1. Проверяет права администратора                    |
::   2. Проверяет наличие программ в репозитории          |
::   3. Устанавливает программы через winget              |
::   4. Настраивает Git (если установлен, пока только его)|
::=========================================================

set admin_errors=0
set install_errors=0
set backup_errors=0

::Проверка прав администратора через костыль
::(Команда для отображения всех сетевый сессий, для её выполнения нужны админ права)
net session >nul 2>&1
if errorlevel 1 (
    set /a admin_errors+=1
    echo [‼️ОШИБКА‼️] Требуются права администратора!
    goto :Exit
)

echo [1/3] Проверка доступности программ в репозитории...
echo.

call :Check "Zen-Team.Zen-Browser" "Zen Browser"
call :Check "Discord.Discord" "Discord"
call :Check "Git.Git" "Git"
call :Check "Rainmeter.Rainmeter" "Rainmeter"
call :Check "Valve.Steam" "Steam"
call :Check "Telegram.TelegramDesktop" "Telegram"
call :Check "Microsoft.VisualStudioCode" "VS Code"
call :Check "Microsoft.VisualStudio.2022.Community" "Visual Studio 2022 Community"
call :Check "Python.Python.3.12" "Python 3.12"

echo Нету Nvidia App, Minibin и Windhawk!
echo.

:Choice
set /p choice="Продолжаем установку? [yes/no]"
if "%choice%" == "yes" goto :Continue
if "%choice%" == "no" goto :Exit

echo Неверный ввод! Введите 'yes' или 'no'.
pause
goto :Choice

:Continue
echo [2/3] Установка программ через winget...
echo.

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

winget install --id Rainmeter.Rainmeter -e --silent
if errorlevel 1 (
    echo Не удалось установить Rainmeter
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

winget install --id Microsoft.VisualStudio.2022.Community -e --silent
if errorlevel 1 (
    echo Не удалось установить VS
    set /a install_errors+=1
)

winget install --id Python.Python.3.12 -e --silent
if errorlevel 1 (
    echo Не удалось установить Python 3.12
    set /a install_errors+=1
)

echo Этап установки завершен!
echo.

:Backup
echo [3/3] Восстановление настроек Git...
echo.

:: Проверяем, есть ли Git в стандартном месте
if exist "C:\Program Files\Git\bin\git.exe" (
    "C:\Program Files\Git\bin\git.exe" config --global user.name "whgds1360"
    "C:\Program Files\Git\bin\git.exe" config --global user.email "maxprizrac@gmail.com"
    "C:\Program Files\Git\bin\git.exe" config --global core.quotepath false
    echo Git настроен.
) else (
    set /a backup_errors+=1
    echo ОШИБКА: Git не найден в C:\Program Files\Git\bin\git.exe
    echo Проверьте, что установка прошла успешно.
)
echo.

echo Восстановление завершено! Перезагрузите компьютер для применения некоторых изменений.
echo Ошибок по установке: [%install_errors%]
echo Ошибок по бэкапу: [%backup_errors%]
pause

goto :Exit

:Check
winget search --id %1 >nul 2>&1
if errorlevel 1 (
    echo [❌] %2 - Не найдено
    exit /b 1
) else (
    echo [✅] %2 - Есть в репо
    exit /b 0
)

:Exit
if %install_errors% GTR 0 exit /b 1
if %backup_errors% GTR 0 exit /b 1
if %admin_errors% GTR 0 exit /b 1

exit /b 0
