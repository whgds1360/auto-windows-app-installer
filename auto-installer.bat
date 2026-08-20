@echo off
chcp 65001

echo [1/2] Установка программ через winget...
echo.

echo Нету Nvidia App и Minibin !
echo.

winget install --id Zen-Team.Zen-Browser -e --silent 
winget install --id Discord.Discord -e --silent
winget install --id Git.Git -e --silent
winget install --id Rainmeter.Rainmeter -e --silent
winget install --id Valve.Steam -e --silent
winget install --id Telegram.TelegramDesktop -e --silent
winget install --id Microsoft.VisualStudioCode -e --silent
winget install --id Microsoft.VisualStudio.2022.Community -e --silent
winget install --id Windhawk.Windhawk -e --silent
winget install --id Python.Python.3.12 -e --silent


echo Все программы установлены!
echo.

echo [2/2] Восстановление сохранённых настроек...
echo.

:: Проверяем, есть ли Git в стандартном месте
if exist "C:\Program Files\Git\bin\git.exe" (
    "C:\Program Files\Git\bin\git.exe" config --global user.name "whgds1360"
    "C:\Program Files\Git\bin\git.exe" config --global user.email "maxprizrac@gmail.com"
    "C:\Program Files\Git\bin\git.exe" config --global core.quotepath false
    echo Git настроен.
) 

else (
    echo ОШИБКА: Git не найден в C:\Program Files\Git\bin\git.exe
    echo Проверьте, что установка прошла успешно.
)
echo.

echo Восстановление завершено! Перезагрузите компьютер для применения некоторых изменений.
pause
