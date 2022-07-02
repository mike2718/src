@echo off
setlocal enabledelayedexpansion

cls

set /a numleft=0
for /f "usebackq tokens=*" %%l in (`dir /b /s ^| find "" /v /c`) do (
    set /a numleft=%%l
)

rem include this block if you want to have 5% recovery data
for /f "usebackq tokens=*" %%i in (`dir /b /s`) do (
    if not exist "%%~nxi"-5p.par2 (
        if not "%%~xi" == ".par2" (
            if not "%%~zi" == 0 (
                echo !numleft! original files left
                par2.exe c -q -n1 -r5 "%%~nxi"
                del /q "%%~nxi".par2
                move /y "%%~nxi".vol*par2 "%%~nxi"-5p.par2 >nul
            )
        )
    )
    set /a numleft-=1
)
