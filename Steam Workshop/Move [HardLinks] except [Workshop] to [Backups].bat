﻿@echo off
cd /d %~dp0
PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~n0.ps1"
pause