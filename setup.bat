@echo off
REM AI Project Starter: Setup Wrapper
REM This batch file runs setup.ps1 with the correct execution policy.
REM Usage: setup.bat "C:\Path\To\Your\NewProject"

if "%~1"=="" (
    echo Error: Please provide a target directory path.
    echo Usage: setup.bat "C:\Path\To\Your\NewProject"
    exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%~dp0setup.ps1" "%~1"
