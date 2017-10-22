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
if /i "%COMPILER%"=="vc14"   	goto L_VC14
if /i "%COMPILER%"=="vc14x64"	goto L_VC14x64
if /i "%COMPILER%"=="vc12"   	goto L_VC12
if /i "%COMPILER%"=="vc12x64"	goto L_VC12x64
if /i "%COMPILER%"=="vc11"   	goto L_VC11
if /i "%COMPILER%"=="vc11x64"	goto L_VC11x64
if /i "%COMPILER%"=="vc10"   	goto L_VC10
if /i "%COMPILER%"=="vc10x64"	goto L_VC10x64
if /i "%COMPILER%"=="vc9"   	goto L_VC9
if /i "%COMPILER%"=="vc9x64"   	goto L_VC9x64
if /i "%COMPILER%"=="vc8"   	goto L_VC8
if /i "%COMPILER%"=="vc8x64"   	goto L_VC8x64
if /i "%COMPILER%"=="vc71"   	goto L_VC71
if /i "%COMPILER%"=="vc6"   	goto L_VC6
if /i "%COMPILER%"=="tdm32"	goto L_TDM32
if /i "%COMPILER%"=="tdm64"	goto L_TDM64
if /i "%COMPILER%"=="mingw"    	goto L_MINGW
if /i "%COMPILER%"=="mingw_345"	goto L_MINGW_345
if /i "%COMPILER%"=="clang" 	goto L_CLANG31
if /i "%COMPILER%"=="cygwin"   	goto L_CYGWIN
if /i "%COMPILER%"=="dmc" 	goto L_DMC856
if /i "%COMPILER%"=="watcom"   	goto L_OW19
if /i "%COMPILER%"=="ow"       	goto L_OW19
if /i "%COMPILER%"=="borland"   goto L_BCC55
if /i "%COMPILER%"=="bcc"      	goto L_BCC55
if /i "%COMPILER%"=="pcc"   	goto L_PCC
if /i "%COMPILER%"=="lcc"	goto L_LCC
if /i "%COMPILER%"=="lccwin"   	goto L_LCCWIN
if /i "%COMPILER%"=="pellesc"   goto L_PELLESC32
if /i "%COMPILER%"=="pellesc64" goto L_PELLESC64
if /i "%COMPILER%"=="tinyc"   	goto L_TINYC
if /i "%COMPILER%"=="tinyc64"  	goto L_TINYC64
if /i "%COMPILER%"=="occ"	goto L_ORANGEC
if /i "%COMPILER%"=="orangec"	goto L_ORANGEC
if /i "%COMPILER%"=="coins"   	goto L_COINS
if /i "%COMPILER%"=="lsic86"   	goto L_LSIC86

echo setcc COMPILER
echo   COMPILER:
echo       vc11,vc10,vc9,vc8,vc71
echo       vc11x64,vc10x64,vc9x64,vc8x64
echo       mingw,mingw_345,tdm32,tdm64
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

:L_VC14
	call "%VS140COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC14x64
	call "%VS140COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC12
	call "%VS120COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC12x64
	call "%VS120COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC11
	call "%VS110COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC11x64
	call "%VS110COMNTOOLS%..\..\vc\bin\amd64\vcvars64.bat"
	goto :EOF

:L_VC10
	call "%VS100COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC10x64
	call "%VS100COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC9
	call "%VS90COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC9x64
	call "%VS90COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC8
	call "%VS80COMNTOOLS%vsvars32.bat"
	goto :EOF

:L_VC8x64
	call "%VS80COMNTOOLS%..\..\vc\bin\amd64\vcvarsamd64.bat"
	goto :EOF

:L_VC71
	if "%VC71_DIR%"=="" set "VC7_DIR=%ProgramFiles(x86)%\Microsoft Visual Studio .NET 2003"
	set "INCLUDE=%VC71_DIR%\SDK\v1.1\include\"
	set "LIB=%VC71_DIR%\SDK\v1.1\Lib\"
	call "%VC71_DIR%\Common7\tools\vsvars32.bat"
	goto :EOF

:L_VC6
	if "%VC6_DIR%"=="" set "VC6_DIR=%ProgramFiles(x86)%\Microsoft Visual Studio"
	call "%VC6_DIR%\VC6\bin\vcvars32.bat"
	goto :EOF

:L_CYGWIN
	set "PATH=c:\tools\coins\bin;c:\cygwin\bin;%PATH%"
	goto :EOF

:L_TDM32
	set COMPILER=mingw
	set "MINGW_DIR=c:\tools\MinGW32_471tdm"
	set "PATH=%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_TDM64
	set COMPILER=mingw
	set "MINGW_DIR=c:\tools\MinGW64_471tdm"
	set "PATH=%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_MINGW_345
	set COMPILER=mingw
	set MSYS_ROOT=c:\tools\MinGW32_345
	set MINGW_DIR=%MSYS_ROOT%\mingw
	set "PATH=%MSYS_ROOT%\bin;%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_MINGW
	set COMPILER=mingw
	set MINGW_DIR=c:\MinGW
	set MSYS_ROOT=%MINGW_DIR%\msys\1.0
	set "PATH=%MSYS_ROOT%\bin;%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_CLANG31
	set COMPILER=clang
	set MINGW_DIR=c:\MinGW
	set MSYS_ROOT=%MINGW_DIR%\msys\1.0
	set "PATH=%MSYS_ROOT%\bin;%MINGW_DIR%\bin;%PATH%"
	goto :EOF

:L_DMC856
	set DMD_ROOT=c:\tools
	set "PATH=%DMD_ROOT%\dm856free\bin;c:\tools\dsss\bin;%PATH%"
	goto :EOF

:L_OW19
	SET WATCOM=d:\tools\watcom1.9
	SET "PATH=%WATCOM%\BINNT;%WATCOM%\BINW;%PATH%"
	SET "EDPATH=%WATCOM%\EDDAT"
	SET "INCLUDE=%WATCOM%\H;%WATCOM%\H\NT;%INCLUDE%"
	SET "FINCLUDE=%WATCOM%\SRC\FORTRAN"
	goto :EOF

:L_BCC55
	set  BORLANDC55=c:\tools\borland\bcc55
	set  "PATH=%BORLANDC55%\bin;%PATH%"
	set  "include=%BORLANDC55%\include;%BORLANDC55%\include\Rw;%BORLANDC55%\include\psdk"
	goto :EOF

:L_LCC
	set "LCC_DIR=c:\tools\lcc"
	set "PATH=%PATH%"
	call "%VS90COMNTOOLS%vsvars32.bat"
	set "PATH=%LCC_DIR%\bin;%PATH%"
	goto :EOF

:L_LCCWIN
	set "LCCWIN64_DIR=c:\tools\lccwin64"
	set "PATH=%LCCWIN64_DIR%\bin;%PATH%"
	set "INCLUDE=%LCCWIN64_DIR%\include;%INCLUDE%"
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
	set "PellesCDir=C:\Program Files\PellesC"
	set "PATH=%PellesCDir%\bin;%PATH%"
	set "INCLUDE=%PellesCDir%\include;%PellesCDir%\include\win;%INCLUDE%"
	set "LIB=%PellesCDir%\lib;%PellesCDir%\lib\win64;%LIB%"
	goto :EOF

:L_PCC
	set "PCCDIR=c:\tools\pcc"
	set "PATH=%PCCDIR%\bin;%PATH%"
	goto :EOF

:L_TINYC
	set "COMPILER=tinyc"
	set "PATH=c:\tools\tcc0926;%PATH%"
	rem set MSYS_ROOT=c:\tools\MinGW_462_Clang3.1\msys\1.0
	rem set "PATH=c:\tools\tcc0926;%MSYS_ROOT%\bin;%MSYS_ROOT%\MinGW\bin;%PATH%"
	goto :EOF

:L_TINYC64
	set "COMPILER=tinyc64"
	set "PATH=c:\tools\tcc0926x64;%PATH%"
	goto :EOF

:L_ORANGEC
	set "COMPILER=orangec"
	set "ORANGEC=%ProgramFiles(x86)%\Orange C 386"
	set "PATH=%ORANGEC%\bin;%PATH%"
	rem set "INCLUDE=%ORANGEC%\include;%INCLUDE%"
	rem set "LIB=%ORANGEC%\lib;%LIB%"
	goto :EOF

:L_COINS
	set "COMPILER=coins"
	set "PATH=c:\tools\coins\bin;c:\cygwin\bin;%ProgramFiles(x86)%\java\jre7\bin;%PATH%"
	goto :EOF

:L_LSIC86
	set "COMPILER=lsic86"
	rem set "PATH=c:\tools\lsic86\bin;%PATH%"
	set "PATH=c:\tools\lsic330c\bin;c:\bin;%windir%\system32;%windir%;"
	goto :EOF
