@echo off

net session


:display
	cls
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "			  _________                 ________.____________ 		   "
	echo "			 /   _____/ ____           /   __   \   ____/_   |		   "
	echo "			 \_____  \_/ ___\   ______ \____    /____  \ |   |		   "
	echo "			 /        \  \___  /_____/    /    //       \|   |		   "
	echo "			/_______  /\___  >           /____//______  /|___|		   "
	echo "			        \/     \/                         \/      		   "
	echo "                                                            		   " 
	echo "~~~~~~~~~~~~~Written by: Sawyer Womack AFJROTC SC-951~~~~~~~~~~~~~~~~"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1) Scan for Media Files																   "
	echo "69) Exit						70)Reboot							   "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	set /p answer=Please choose an option: 
	if "%answer%"=="69" exit
	if "%answer%"=="70" shutdown /r
	if "%answer%"=="1"  goto :media

:media
	:: searches for prohibited file formats and stores them in text files
	dir \Users\*.jpg /s >jpg.txt
	pause
	dir \Users\*.mp3 /s >mp3.txt
	pause
	dir \Users\*.mp4 /s >mp4.txt
	pause
	dir \Users\*.png /s >png.txt
	pause
	dir \Users\*.mov /s >mov.txt
	pause

	goto :display

:changePasswords
	:: code that might work from previous script but idk and i cant test 
	::until i setup a machine with multiple users
	echo Changing all user passwords
	
	endlocal
	setlocal EnableExtensions
	for /F "tokens=2* delims==" %%G in ('
		wmic UserAccount where "status='ok'" get name >null
	') do for %%g in (%%~G) do (
		net user %%~g CyberPatriots23$$
		)
	endlocal
	setlocal enabledelayedexpansion	
	pause
	goto :display
	
:disableGuest
	echo find bad files
	goto :display

:passwordPolicy
	echo find bad files
	goto :display

:lockoutPolicy
	echo find bad files
	goto :display

:enableFirewall
	echo find bad files
	goto :display

:disableServices
	echo find bad files
	goto :display

:remoteDesktop
	echo find bad files
	goto :display

:autoUpdate
	echo find bad files
	goto :display

:securityOptions
	echo find bad files
	goto :display

:auditPolicy
	echo find bad files
	goto :display








