@echo off
rem コマンドラインコンパイラ環境切り替えバッチのサンプル.
rem 各自の環境に合わせて COMPILER や そのパスを設定し直してください。
set INCLUDE= 
set LIB= 

if "%ProgramFiles(x86)%"=="" set "ProgramFiles(x86)=%ProgramFiles%"

if "%cc_save_path%"=="" set "cc_save_path=%path%"
set "cc_base_path=%cc_save_path%"
set "PATH=%cc_base_path%"

set COMPILER=%1
shift
if /i "%COMPILER%"=="vc141"   	goto L_VC141
if /i "%COMPILER%"=="vc141x64"	goto L_VC141x64
if /i "%COMPILER%"=="vc140"   	goto L_VC140
if /i "%COMPILER%"=="vc140x64"	goto L_VC14x64
if /i "%COMPILER%"=="vc120"   	goto L_VC120
if /i "%COMPILER%"=="vc120x64"	goto L_VC120x64
if /i "%COMPILER%"=="vc110"   	goto L_VC110
if /i "%COMPILER%"=="vc110x64"	goto L_VC110x64
if /i "%COMPILER%"=="vc100"   	goto L_VC100
if /i "%COMPILER%"=="vc100x64"	goto L_VC100x64
if /i "%COMPILER%"=="vc90"   	goto L_VC90
if /i "%COMPILER%"=="vc90x64"   goto L_VC90x64
if /i "%COMPILER%"=="vc80"   	goto L_VC80
if /i "%COMPILER%"=="vc80x64"   goto L_VC80x64
if /i "%COMPILER%"=="vc71"   	goto L_VC71
if /i "%COMPILER%"=="vc60"   	goto L_VC60
if /i "%COMPILER%"=="tdm32"	goto L_TDM32
if /i "%COMPILER%"=="tdm32_503"	goto L_TDM32
if /i "%COMPILER%"=="tdm64"	goto L_TDM64
if /i "%COMPILER%"=="tdm64_502"	goto L_TDM64
if /i "%COMPILER%"=="mingw32"  	goto L_TDM32
if /i "%COMPILER%"=="mingw64"  	goto L_TDM64
if /i "%COMPILER%"=="clang" 	goto L_CLANG31
if /i "%COMPILER%"=="cygwin"   	goto L_CYGWIN
if /i "%COMPILER%"=="dmc" 	goto L_DMC
if /i "%COMPILER%"=="watcom"   	goto L_OW19
if /i "%COMPILER%"=="ow"       	goto L_OW19
if /i "%COMPILER%"=="bcc32"	goto L_BCC32_551
if /i "%COMPILER%"=="bcc55"	goto L_BCC32_551
if /i "%COMPILER%"=="bcc32c" 	goto L_BCC32C
if /i "%COMPILER%"=="bcc72"	goto L_BCC32C
if /i "%COMPILER%"=="bcc"	goto L_BCC32C
if /i "%COMPILER%"=="occ"	goto L_ORANGEC
if /i "%COMPILER%"=="orangec"	goto L_ORANGEC
if /i "%COMPILER%"=="tinyc"   	goto L_TINYC
if /i "%COMPILER%"=="tinyc64"  	goto L_TINYC64
if /i "%COMPILER%"=="pellesc"   goto L_PELLESC32
if /i "%COMPILER%"=="pellesc64" goto L_PELLESC64
if /i "%COMPILER%"=="pcc"   	goto L_PCC
if /i "%COMPILER%"=="lcc"	goto L_LCC
if /i "%COMPILER%"=="lccwin64" 	goto L_LCCWIN64
if /i "%COMPILER%"=="coins"   	goto L_COINS
if /i "%COMPILER%"=="lsic86"   	goto L_LSIC86

echo setcc COMPILER
echo   COMPILER:
echo       vc141,vc140,vc120,vc110,vc10,vc90,vc80,vc71
echo       vc141x64,vc120x64,vc110x64,vc100x64,vc90x64,vc80x64
echo       tdm32,tdm64
echo       clang,dmc,ow,bcc,pcc
echo       lcc,pccwin,pellesc,pellesc64
echo       orangec,coins,lsic86
goto :EOF


:L_VC141
	if "%VC141_DIR%"=="" set "VC141_DIR="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community"
	pushd .
	call "%VC141_DIR%\Common7\Tools\VsMSBuildCmd.bat"
	call "%VC141_DIR%\VC\Auxiliary\Build\vcvars32.bat"
	popd
	goto :EOF

:L_VC141x64
	if "%VC141_DIR%"=="" set "VC141_DIR="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community"
	pushd .
	call "%VC141_DIR%\Common7\Tools\VsMSBuildCmd.bat"
	call "%VC141_DIR%\VC\Auxiliary\Build\vcvars64.bat"
	popd
	goto :EOF

:L_VC140
	call "%VS140COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC140x64
	call "%VS140COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC120
	call "%VS120COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC120x64
	call "%VS120COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC110
	call "%VS110COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC110x64
	call "%VS110COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC100
	call "%VS100COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC100x64
	call "%VS100COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC90
	call "%VS90COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC90x64
	call "%VS90COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC80
	call "%VS80COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC80x64
	call "%VS80COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC71
	if "%VC71_DIR%"=="" set "VC7_DIR=%ProgramFiles(x86)%\Microsoft Visual Studio .NET 2003"
	set "INCLUDE=%VC71_DIR%\SDK\v1.1\include\"
	set "LIB=%VC71_DIR%\SDK\v1.1\Lib\"
	call "%VC71_DIR%\Common7\tools\vsvars32.bat"
	goto :EOF

:L_VC60
	if "%VC6_DIR%"=="" set "VC6_DIR=%ProgramFiles(x86)%\Microsoft Visual Studio"
	call "%VC6_DIR%\VC6\bin\vcvars32.bat"
	goto :EOF

:L_CYGWIN
	set "PATH=c:\tools\coins\bin;c:\cygwin\bin;%PATH%"
	goto :EOF

:L_TDM32
	set COMPILER=mingw32tdm
	set "MINGW_DIR=c:\tools\TDM-GCC-32-5.0.3"
	set "PATH=%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_TDM64
	set COMPILER=mingw64tdm
	set "MINGW_DIR=c:\tools\TDM-GCC-64-5.0.2"
	set "PATH=%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_CLANG31
	set COMPILER=clang
	set MINGW_DIR=c:\MinGW
	set MSYS_ROOT=%MINGW_DIR%\msys\1.0
	set "PATH=%MSYS_ROOT%\bin;%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_DMC
	set DMD_ROOT=c:\tools
	set "PATH=%DMD_ROOT%\dm_free\bin;c:\tools\dsss\bin;%PATH%"
	goto :EOF

:L_OW19
	SET WATCOM=d:\tools\watcom1.9
	SET "PATH=%WATCOM%\BINNT;%WATCOM%\BINW;%PATH%"
	SET "EDPATH=%WATCOM%\EDDAT"
	SET "INCLUDE=%WATCOM%\H;%WATCOM%\H\NT;%INCLUDE%"
	SET "FINCLUDE=%WATCOM%\SRC\FORTRAN"
	goto :EOF

:L_BCC32_551
	set "COMPILER=borlandc"
	set  BORLANDC55=c:\tools\borland\bcc55
	set  "PATH=%BORLANDC55%\bin;%PATH%"
	rem set  "include=%BORLANDC55%\include;%BORLANDC55%\include\Rw;%BORLANDC55%\include\psdk"
	goto :EOF

:L_BCC32C
	set "COMPILER=embarcaderoc"
	set  EMBARCADEROC101=c:\tools\bcc101
	set  "PATH=%EMBARCADEROC101%\bin;%PATH%"
	goto :EOF

:L_ORANGEC
	set "COMPILER=orangec"
	set "ORANGEC=%ProgramFiles(x86)%\Orange C 386"
	set "PATH=%ORANGEC%\bin;%PATH%"
	goto :EOF

:L_TINYC
	set "COMPILER=tinyc"
	set "PATH=c:\tools\tcc-0.9.26win32;%PATH%"
	goto :EOF

:L_TINYC64
	set "COMPILER=tinyc64"
	set "PATH=c:\tools\tcc-0.9.26win64;%PATH%"
	goto :EOF

:L_PELLESC32:
	set "COMPILER=pellesc"
	set "PellesCDir=c:\Program Files (x86)\PellesC"
	set "PATH=%PellesCDir%\bin;%PATH%"
	set "INCLUDE=%PellesCDir%\include;%PellesCDir%\include\win;%INCLUDE%"
	set "LIB=%PellesCDir%\lib;%PellesCDir%\lib\win;%LIB%"
	goto :EOF

:L_PELLESC64:
	set "COMPILER=pellesc64"
	set "PellesCDir=%ProgramFiles%\PellesC"
	set "PATH=%PellesCDir%\bin;%PATH%"
	set "INCLUDE=%PellesCDir%\include;%PellesCDir%\include\win;%INCLUDE%"
	set "LIB=%PellesCDir%\lib;%PellesCDir%\lib\win64;%LIB%"
	goto :EOF

:L_LCC
	set "LCC_DIR=c:\tools\lcc"
	set "PATH=%PATH%"
	call "%VS90COMNTOOLS%vsvars32.bat"
	set "PATH=%LCC_DIR%\bin;%PATH%"
	goto :EOF

:L_PCC
	set "PCCDIR=c:\tools\pcc"
	set "PATH=%PCCDIR%\bin;%PATH%"
	goto :EOF

:L_COINS
	set "COMPILER=coins"
	set "PATH=c:\tools\coins\bin;c:\cygwin\bin;%ProgramFiles%\Java\jdk1.8.0_131\jre\bin;%PATH%"
	goto :EOF

:L_LSIC86
	set "COMPILER=lsic86"
	rem set "PATH=c:\tools\lsic86\bin;%PATH%"
	set "PATH=d:\tools\lsic330c\bin;c:\bin;%windir%\system32;%windir%;"
	goto :EOF

:L_LCCWIN64
	set "LCCWIN64_DIR=c:\tools\lccwin64"
	set "PATH=%LCCWIN64_DIR%\bin;%PATH%"
	set "INCLUDE=%LCCWIN64_DIR%\include;%INCLUDE%"
	goto :EOF
