:: Восстановление конфигурации Git
set backup_errors=0

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

:Exit
if %backup_errors% GTR 0 (
    exit /b 1
) else (
    exit /b 0
)