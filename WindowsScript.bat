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
	echo "1) Scan for Media Files		2) change all passwords				   "
	echo "3) disable guest account		4) Password Policy					   "
	echo "5) Lockout Policy			    6) Enable Firewall  				   "
	echo "7) User Rights        		8) Disable Services				   	   "
	echo "9) Remote Desktop Config		10) Auto Update				   		   "
	echo "11) Security Options  		12) Audit Policy				       "
	echo "69) Exit						70) Reboot							   "
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
	net user Guest CyberPatriots23$$ /active:no
	goto :display

:passwordPolicy
	net accounts /minpwlen:10
	net accounts /maxpwage:60
	net accounts /minpwage:10
	net accounts /uniquepw:3


:lockoutPolicy
	net accounts /lockoutduration:30
	net accounts /lockoutthreshold:3
	net accounts /lockoutwindow:15
	goto :display

:enableFirewall
	NetSh Advfirewall set allprofiles state on
	Netsh Advfirewall show allprofiles

:userRights
	goto :display

:disableServices
	echo Disabling Services
	sc stop TapiSrv
	sc config TapiSrv start= disabled
	sc stop TlntSvr
	sc config TlntSvr start= disabled
	sc stop ftpsvc
	sc config ftpsvc start= disabled
	sc stop SNMP
	sc config SNMP start= disabled
	sc stop SessionEnv
	sc config SessionEnv start= disabled
	sc stop TermService
	sc config TermService start= disabled
	sc stop UmRdpService
	sc config UmRdpService start= disabled
	sc stop SharedAccess
	sc config SharedAccess start= disabled
	sc stop remoteRegistry 
	sc config remoteRegistry start= disabled
	sc stop SSDPSRV
	sc config SSDPSRV start= disabled
	sc stop W3SVC
	sc config W3SVC start= disabled
	sc stop SNMPTRAP
	sc config SNMPTRAP start= disabled
	sc stop remoteAccess
	sc config remoteAccess start= disabled
	sc stop RpcSs
	sc config RpcSs start= disabled
	sc stop HomeGroupProvider
	sc config HomeGroupProvider start= disabled
	sc stop HomeGroupListener
	sc config HomeGroupListener start= disabled
	
	pause
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
	auditpol /set /category:"Account Logon" /Success:enable /failure:enable >nul
	auditpol /set /category:"Logon/Logoff" /Success:enable /failure:enable >nul
	auditpol /set /category:"Account Management" /Success:enable /failure:enable >nul
	Auditpol /set /category:"DS Access" /failure:enable >nul
	Auditpol /set /category:"Object Access" /failure:enable >nul
	Auditpol /set /category:"policy change" /Success:enable /failure:enable >nul
	Auditpol /set /category:"Privilege use" /Success:enable /failure:enable >nul
	Auditpol /set /category:"System" /failure:enable >nul
	goto :display








