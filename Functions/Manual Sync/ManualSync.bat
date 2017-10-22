@echo off
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
echo Copying Files... %datetime%

XCopy "D:\Sync\MegaSync\Languages\Autoit\Programs\30Second\FINAL - Copy\[BETA]30 Avg Revamp.au3" "D:\Sync\MegaSync\Languages\Autoit\Programs\30Second\Repository\"Revamp%datetime%".au3"*

Pause
