@echo off
setlocal
set "f="
set "self=%~0"
set "exe="
:opt
set "a=%~1"
if "%a%" == "" (
  goto kill
) else if "%a%" == "-9" (
  set "f=/f"
) else if defined exe (
  echo %self%: only one pattern can be provided & goto end
) else if not "%a:~-3%" == "exe" (
  set "exe=%a%.exe"
) else (
  set "exe=%a%"
)
shift
goto opt
 
:kill
if defined exe C:\Windows\System32\taskkill.exe %f% /im "%exe%"
 
:end
endlocal