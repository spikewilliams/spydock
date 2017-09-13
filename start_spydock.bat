@echo off
set PASS=%1
IF "%PASS%"=="" (ECHO Usage: start_spydock.bat [notebook_password]) ELSE (
  docker run -d=true  -p=8888:8888 -v=%CD%/notebooks:/notebooks -v=%CD%/data:/data -v=%CD%/config:/config --name spydock-notebook -e PASSWORD=%PASS% spikewilliams/spydock
)
