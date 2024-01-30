@echo off
title LogoFAIL comEDI remasterd v1

REM ================
REM 	Setup
REM ================
:setup
cls
title LogoFAIL by nukerhugo
echo ###############
echo #             #
echo #  LogoFAIL   #
echo #             #
echo ###############
echo Scripts by nukerhugo and Neo.
echo Remasterd options CallMeCallzone and RickedWifiMan
echo --------------------------------------------------
echo Start LogoFAIL.................................[1]
echo Remove LogoFAIL................................[2]
echo Exit Flash Script..............................[3]
echo --------------------------------------------------
echo LogoFAIL is not responsible for any damages caused by this script.
echo --------------------------------------------------
set /p input=:
if %input%==1 call :start
if %input%==3 exit
if %input%==2 call :delete
if not %input%==1,2,3 goto setup
goto :EOF

:delete
cls
echo Tracking...
cd %USERPROFILE%
IF NOT ERRORLEVEL 1 (
	echo Tracked location to %USERPROFILE%
	echo Tracked location to C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	cd C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	IF NOT ERRORLEVEL 1 (
		echo Checking for logoFAIL...
		IF EXIST ".\LogoFAILtext.txt" (
			ECHO Removing LogoFAIL...
			del LogoFAILtext.txt
			del LogoFAILlogo.png
			echo Success!
			echo LogoFAIL was successfully removed!
		) ELSE (
			ECHO FATAL ERROR: Can't find LogoFAIL. can't continue. 
		)
	)
)
pause
goto setup

:start
cls
echo Are you sure you want to install LogoFAIL?
pause
echo Starting...
TIMEOUT 3 >null
echo Tracking...
copy LogoFAILlogo.png "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cd C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
IF NOT ERRORLEVEL 1 (
	echo Tracked location to C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	echo LogoFAIL Installing...
	echo "Your PC is infected with LogoFAIL">LogoFAILtext.txt
	echo Installed Successfully!
)
pause
goto setup
