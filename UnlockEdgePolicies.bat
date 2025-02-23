@echo off
:start
cls
title UnlockEdgePolicies
echo.
echo. UnlockEdgePolicies
echo. AKA pretend to be joined to MDM
echo. https://github.com/PearPony/UnlockEdgePolicies
echo. Solution has been taken from https://hitco.at
echo.
echo. !!! PLEASE RUN THIS AS AN ADMINISTRATOR !!!
echo.
echo. Type in "apply" to run the script
echo. Type in "revert" to revert changes made by the script
echo.
echo. Type in "exit" to exit
echo.
set /p typein= Enter your choice: 

if %typein% == apply goto apply
if %typein% == revert goto revert
if %typein% == exit goto exit

goto wrong
:wrong
title Unknown entry
cls
echo.
echo. Not found.
echo.
pause
cls
goto start



:apply
cls
echo Applying Fake MDM-Enrollment - Key 1 of 2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "EnrollmentState" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "EnrollmentType" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "IsFederated" /t REG_DWORD /d 0 /f

echo Applying Fake MDM-Enrollment - Key 2 of 2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "Flags" /t REG_DWORD /d 14069951 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "AcctUId" /t REG_SZ /d "0x000000000000000000000000000000000000000000000000000000000000000000000000" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "RoamingCount" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "SslClientCertReference" /t REG_SZ /d "MY;User;0000000000000000000000000000000000000000" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /v "ProtoVer" /t REG_SZ /d "1.2" /f

echo.
echo Your OS is now pretending to be in MDM. Please restart your computer manually.
timeout 10
goto start



:revert
cls
echo Reverting Fake MDM-Enrollment - Key 1 of 2
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Enrollments\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /f

echo Reverting Fake MDM-Enrollment - Key 2 of 2
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF" /f

echo.
echo Your OS is not pretending to be in MDM anymore.
timeout 10
goto start



:exit
exit