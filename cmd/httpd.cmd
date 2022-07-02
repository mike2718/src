@echo off
taskkill /f /t /im:yasslEWS.exe
start E:\cmdtool\yasslEWS.exe -s E:\cmdtool\server.pem -p 28657,28658s -r E:\down -e E:\yasslEWS_error_log.txt
rem tasklist /fi "imagename eq yasslEWS.exe"
