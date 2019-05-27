@echo off
set PASS=%1

call settings.cmd

IF "%PASS%"=="" (ECHO Usage: start_spydock.bat [notebook_password]) ELSE (
  IF "%PORT%"=="" (set PORT=8888)
  docker run -d=true  -p=%PORT%:8888 -v=%CD%/notebooks:/notebooks -v=%CD%/data:/data -v=%CD%/config:/config --name %CONTAINER_NAME% -e PASSWORD=%PASS% spikewilliams/spydock
)
