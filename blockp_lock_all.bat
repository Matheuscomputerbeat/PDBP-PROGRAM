@echo off
:: === Elevação para Admin ===
net session >nul 2>&1
if %errorlevel% neq 0 (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -Verb RunAs -FilePath '%~f0'"
  exit /b
)

echo [1/4] Criando chaves de politica do Chrome (HKLM e HKCU)...
:: Forcelist em HKLM
reg add "HKLM\SOFTWARE\Policies\Google" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 1 /t REG_SZ /d "llfdaleknghepofjcleahemgndnaghhk;https://clients2.google.com/service/update2/crx" /f >nul

:: Forcelist em HKCU
reg add "HKCU\SOFTWARE\Policies\Google" /f >nul
reg add "HKCU\SOFTWARE\Policies\Google\Chrome" /f >nul
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /f >nul
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 1 /t REG_SZ /d "llfdaleknghepofjcleahemgndnaghhk;https://clients2.google.com/service/update2/crx" /f >nul

:: Opcional: bloquear chrome://* (todas as páginas internas). DESCOMENTE SE QUISER.
:: reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v URLBlocklist /t REG_MULTI_SZ /d "chrome://*" /f >nul
:: reg add "HKCU\SOFTWARE\Policies\Google\Chrome" /v URLBlocklist /t REG_MULTI_SZ /d "chrome://*" /f >nul

echo [2/4] Garantindo base de Policies (HKLM e HKCU)...
reg add "HKLM\SOFTWARE\Policies" /f >nul
reg add "HKCU\SOFTWARE\Policies" /f >nul

echo [3/4] Criando arquivo de travas (permissoes somente leitura p/ 'Todos')...
set "LOCKFILE=%temp%\lock_policies.txt"
> "%LOCKFILE%" echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies [1]
>>"%LOCKFILE%" echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google [1]
>>"%LOCKFILE%" echo HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome [1]
>>"%LOCKFILE%" echo HKEY_CURRENT_USER\SOFTWARE\Policies [1]
>>"%LOCKFILE%" echo HKEY_CURRENT_USER\SOFTWARE\Policies\Google [1]
>>"%LOCKFILE%" echo HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome [1]

echo [4/4] Aplicando travas com REGINI...
regini "%LOCKFILE%" >nul 2>&1

del "%LOCKFILE%" >nul 2>&1

echo.
echo Concluido. Reinicie o Chrome. Para validar:
echo - 1) chrome://policy deve mostrar ExtensionInstallForcelist com o ID.
echo - 2) Em regedit, Policies e subchaves devem estar somente leitura.
echo.
pause
