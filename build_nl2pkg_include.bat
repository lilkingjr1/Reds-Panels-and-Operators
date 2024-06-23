@echo off
setlocal enabledelayedexpansion

rem build_nl2pkg_include.bat "scenery\reds_panels_and_operators\[ Placards ]" "scenery\reds_panels_and_operators\[ Labels ]"

set "EXTENSIONS=png psd xcf"
set OUTPUT_FILE=%~dp0.nl2pkg_include.nl2script

(
  echo ^<?xml version="1.0" encoding="UTF-8"?^>
  echo ^<root^>
  echo   ^<script^>
  echo     ^<classpath^>Copy the folder in scenery to your park to use^</classpath^>
  echo     ^<class^>WelcomeScript^</class^>
  echo     ^<sharedvm^>true^</sharedvm^>
  echo     ^<resource id="README"^>scenery/reds_panels_and_operators/README.html^</resource^>
) > "%OUTPUT_FILE%"

set COUNT=1
for %%i in (%*) do (
  for %%E in (%EXTENSIONS%) do (
    for %%j in (%%i\*.%%E) do (
      set "CUR_PATH=%%j"
      set "CUR_PATH=!CUR_PATH:\=/!"
      echo !CUR_PATH!
      echo     ^<resource id="resource!COUNT!"^>!CUR_PATH!^</resource^>>> "%OUTPUT_FILE%"
      set /a COUNT+=1
    )
  )
)

(
  echo   ^</script^>
  echo ^</root^>
) >> "%OUTPUT_FILE%"

echo Output written to "%OUTPUT_FILE%"
