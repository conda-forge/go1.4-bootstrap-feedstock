setlocal enabledelayedexpansion

set CGO_ENABLED=0
rem First, build go1.4 using gcc
cd "go1.4-bootstrap\src"
call make.bat
if errorlevel 1 exit 1

rem Don't need the cached build objects
rmdir /s /q "%SRC_DIR%\go1.4-bootstrap\pkg\obj"

mkdir "%PREFIX%\go1.4-bootstrap"
xcopy /s /y /i /q "%SRC_DIR%\go1.4-bootstrap\*" "%PREFIX%\go1.4-bootstrap\"

rem Copy the rendered [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
rem go finds its *.go files via the GOROOT variable
for %%F in (activate deactivate) do (
  if not exist "%PREFIX%\etc\conda\%%F.d" mkdir "%PREFIX%\etc\conda\%%F.d"
  if errorlevel 1 exit 1
  copy "%RECIPE_DIR%\%%F-go1.4-bootstrap.bat" "%PREFIX%\etc\conda\%%F.d\go1.4-bootstrap.bat"
  if errorlevel 1 exit 1
  dir %PREFIX%\etc\conda\%%F.d\
)
