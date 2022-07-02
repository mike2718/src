@echo off
taskkill /f /t /im:slimftpd31.exe
rem %comspec% /k ""D:\cmdtool\slimftpd31.exe""
start E:\cmdtool\slimftpd31.exe
rem tasklist /fi "imagename eq slimftpd31.exe"
