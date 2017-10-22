@echo off
setlocal EnableDelayedExpansion

set CC=
set O_CC=
set O_CC2=
set O_OE=
set O_CO=
set O_C99=
set O_C11=
set CPP_MODE=
set SRCCOPY_MODE=
set ERN=1
set ERR_FILE=err.txt
set /A COUNT=0
set RUN=
set DOS16_MODE=
set ORIG_NAME=
set ADD_FILE1=
set CEXT=c

set COMPI=%1
if "%COMPI%"=="" set COMPI=%COMPILER%
set NAME_CC=%~2
if "%NAME_CC%"=="" set NAME_CC=%COMPI%

if /i "%COMPI%"=="vc60"    	goto L_VC
if /i "%COMPI%"=="vc++60"    	goto L_VC6_PP
if /i "%COMPI%"=="vc71"    	goto L_VC
if /i "%COMPI%"=="vc++71"    	goto L_VC_PP
if /i "%COMPI%"=="vc80"     	goto L_VC
if /i "%COMPI%"=="vc++80"     	goto L_VC_PP
if /i "%COMPI%"=="vc80x64"     	goto L_VC
if /i "%COMPI%"=="vc++80x64"   	goto L_VC_PP
if /i "%COMPI%"=="vc90"     	goto L_VC
if /i "%COMPI%"=="vc++90"     	goto L_VC_PP
if /i "%COMPI%"=="vc90x64"     	goto L_VC
if /i "%COMPI%"=="vc++90x64"    goto L_VC_PP
if /i "%COMPI%"=="vc100"    	goto L_VC
if /i "%COMPI%"=="vc++100"    	goto L_VC_PP
if /i "%COMPI%"=="vc100x64"    	goto L_VC
if /i "%COMPI%"=="vc++100x64"   goto L_VC_PP
if /i "%COMPI%"=="vc110"    	goto L_VC
if /i "%COMPI%"=="vc++110"    	goto L_VC_PP
if /i "%COMPI%"=="vc110x64"    	goto L_VC
if /i "%COMPI%"=="vc++110x64"   goto L_VC_PP
if /i "%COMPI%"=="vc120"    	goto L_VC
if /i "%COMPI%"=="vc++120"    	goto L_VC_PP
if /i "%COMPI%"=="vc120x64"    	goto L_VC
if /i "%COMPI%"=="vc++120x64"   goto L_VC_PP
if /i "%COMPI%"=="vc140"    	goto L_VC
if /i "%COMPI%"=="vc++140"    	goto L_VC_PP
if /i "%COMPI%"=="vc140x64"    	goto L_VC
if /i "%COMPI%"=="vc++140x64"   goto L_VC_PP
if /i "%COMPI%"=="vc141"    	goto L_VC
if /i "%COMPI%"=="vc++141"    	goto L_VC_PP
if /i "%COMPI%"=="vc141x64" 	goto L_VC
if /i "%COMPI%"=="vc++141x64" 	goto L_VC_PP
if /i "%COMPI%"=="gcc"   	goto L_MINGW
if /i "%COMPI%"=="g++"   	goto L_MINGW_PP
if /i "%COMPI%"=="mingw"   	goto L_MINGW
if /i "%COMPI%"=="mingw++" 	goto L_MINGW_PP
if /i "%COMPI%"=="tdm"		goto L_MINGW
if /i "%COMPI%"=="tdm++"	goto L_MINGW_PP
if /i "%COMPI%"=="clang"   	goto L_CLANG
if /i "%COMPI%"=="clang++" 	goto L_CLANG_PP
if /i "%COMPI%"=="dmc"     	goto L_DMC
if /i "%COMPI%"=="dmc++"   	goto L_DMC_PP
if /i "%COMPI%"=="watcom"      	goto L_OW
if /i "%COMPI%"=="ow"      	goto L_OW
if /i "%COMPI%"=="ow++"    	goto L_OW_PP
if /i "%COMPI%"=="bcc32"	goto L_BCC32
if /i "%COMPI%"=="bcc32++"	goto L_BCC32_PP
if /i "%COMPI%"=="bcc32c"	goto L_BCC32C
if /i "%COMPI%"=="bcc32c++"	goto L_BCC32C_PP
if /i "%COMPI%"=="orangec"   	goto L_ORANGEC
if /i "%COMPI%"=="occ"   	goto L_ORANGEC
if /i "%COMPI%"=="occ++"   	goto L_ORANGEC_PP
if /i "%COMPI%"=="tinyc" 	goto L_TINYC
if /i "%COMPI%"=="tinyc64"	goto L_TINYC
if /i "%COMPI%"=="pellesc"   	goto L_PELLESC
if /i "%COMPI%"=="pellesc64"   	goto L_PELLESC64
if /i "%COMPI%"=="pcc" 		goto L_PCC
if /i "%COMPI%"=="lccwin"   	goto L_LCCWIN
if /i "%COMPI%"=="lccwin64"   	goto L_LCCWIN64
if /i "%COMPI%"=="lcc"   	goto L_LCC
if /i "%COMPI%"=="coins"   	goto L_COINS
if /i "%COMPI%"=="lsic86"   	goto L_LSIC86
if /i "%COMPI%"=="clean"	goto L_CLEAN

echo cl_test.bat [COMPILER]
echo vc,vc71,vc8,vc9,vc10,vc11
echo mingw,tdm,clang
echo dmc,ow,bcc,tinyc
goto :L_END

:L_VC6_PP
  set O_CPP=-TP -EHsc -GR
  set CC=cl %O_CPP%
  set CPP_MODE=1
  goto L_VC
:L_VC_PP
  set O_CPP=-TP -EHsc -GR -Zc:forScope,wchar_t
  set CC=cl %O_CPP%
  set CPP_MODE=1
:L_VC
  if "%CC%"=="" set CC=cl
  set O_OE=-Fe
  set O_CO=-c
  set DISP_VER=cl
  set DISP_VER2=findstr Compiler
  goto L_TEST

:L_MINGW_PP
  set CC=g++
  set O_C11=-std=c++11
  set O_C99=-std=c++11
  set CPP_MODE=1
:L_MINGW
  if "%CC%"=="" (
    set CC=gcc
    set O_C99=-std=c99
    set O_C11=-std=c11
  )
  set O_CPP11=-std=c++11
  set O_SJIS=-finput-charset=cp932 -fexec-charset=cp932
  set O_CO=-c
  set O_OE=-o 
  rem set O_CC=-msse
  set ERN=2
  set DISP_VER=gcc --version 
  set DISP_VER2=findstr gcc
  goto L_TEST

:L_CLANG
  set CC=clang
  set O_C99=-std=c99
  set O_C11=-std=c11

:L_CLANG_PP
  if "%CC%"=="" (
    set CC=clang++
    set CPP_MODE=1
    set O_C99=-std=c++11
    set O_C11=-std=c++11
  )
  set O_CPP11=-std=c++11
  rem set O_SJIS=-finput-charset=cp932 -fexec-charset=cp932
  set O_CO=-c
  set O_OE=-o 
  set ERN=2
  set DISP_VER=clang --version 
  set DISP_VER2=grep version
  goto L_TEST

:L_DMC_PP
  set O_CPP=-cpp -Aa -Ab -Ae -Ar
  set CC=dmc %O_CPP%
  set CPP_MODE=1
:L_DMC
  if "%CC%"=="" set CC=dmc
  set O_SJIS=-j0
  set O_CO=-c
  set O_OE=-o
  set DISP_VER=scppn 
  set DISP_VER2=findstr Version
  goto L_TEST

:L_OW_PP
  set O_CPP=-cc++
  set CC=wcl386 %O_CPP%
  set CPP_MODE=1
:L_OW
  if "%CC%"=="" set CC=wcl386
  set O_C99=-za99
  set O_C11=-za99
  set O_SJIS=-zk1
  set O_CO=-c
  set O_OE=-fe=
  set DISP_VER=wcl386 
  set DISP_VER2=findstr Version
  goto L_TEST

:L_BCC32_PP
  set O_CPP=-P
  set CC=bcc32 %O_CPP%
  set CPP_MODE=1
:L_BCC32
  if "%CC%"=="" set CC=bcc32
  set O_CO=-c
  set O_OE=-e
  set DISP_VER=bcc32 
  set DISP_VER2=findstr Borland
  goto L_TEST

:L_BCC32C_PP
  set O_CPP=-P
  set CC=bcc32c %O_CPP%
  set CPP_MODE=1
:L_BCC32C
  if "%CC%"=="" set CC=bcc32c
  set O_CO=-c
  set O_OE=-e
  set DISP_VER=bcc32c
  set DISP_VER2=findstr Embarcadero
  goto L_TEST

:L_TINYC
  set CC=tcc
  set O_CO=-c
  set O_OE=-o 
  set DISP_VER=tcc 
  set DISP_VER2=findstr Compiler
  goto L_TEST

:L_ORANGEC_PP
  if exist __ext_cpp call gen_ext_cpp.bat
  set DSTEXT=cpp
  set CPP_MODE=1
:L_ORANGEC
  set CC=occ
  set SRCCOPY_MODE=1
  set O_C99=/9
  set O_C11=/1
  set O_CO=/c
  set O_OE=/o
  set DISP_VER=occ 
  set DISP_VER2=findstr Version
  goto L_TEST

:L_PCC
  set CC=pcc
  set O_CO=-c
  set O_OE=-o 
  set ERN=2
  set DISP_VER=pcc --version 
  set DISP_VER2=findstr pcc
  goto L_TEST

:L_PELLESC64
  set O_CC=-Tamd64-coff
  set CC=cc %O_CC%
  set O_CC2=-machine:amd64 -subsystem:console
:L_PELLESC
  if "%CC%"=="" set CC=cc
  if "%O_CC2%"=="" set O_CC2=-machine:x86 -subsystem:console
  set O_CC=-Gd %O_CC%
  set O_CO=-c
  set O_OE=-Fe
  set O_C99=-std:C99
  set O_C11=-std:C11
  set DISP_VER=cc
  set DISP_VER2=findstr Pelles
  goto L_TEST

:L_LCCWIN64
  set O_CC=
  set CC=lc64 %O_CC%
:L_LCCWIN
  if "%CC%"=="" set CC=lc
  set O_CO=-c
  set O_OE=
  set DISP_VER=lcc -v
  set DISP_VER2=findstr version
  goto L_TEST

:L_LCC
  set CC=lcc
  set O_CO=-c
  set O_OE=-o 
  set DISP_VER=lcc -v 2
  set DISP_VER2=findstr lcc
  goto L_TEST

:L_COINS
  set CC=java -classpath c:/tools/coins/coins-1.4.5.2-en/classes coins.driver.Driver -coins:target=x86-cygwin,assembler=as
  set O_CO=-c
  set O_OE=-o 
  set DISP_VER=echo coins-1.4.5.2-en
  set DISP_VER2=findstr coins
  goto L_TEST

:L_LSIC86
  set CC=lcc
  set O_CO=-c
  set O_OE=-o
  set DOS16_MODE=1
  set SRCCOPY_MODE=1
  set DISP_VER=echo LSI-C86 v3.30c sisyoku-ver.
  set DISP_VER2=findstr LSI-C86
  rem set RUN=msdos.exe
  goto L_TEST

:L_TEST
echo C Language Feature Test
echo    target=%COMPI%
set     OBJ_DIR=obj\%COMPI%
if not exist "obj"          mkdir "obj"
if not exist "%OBJ_DIR%"    mkdir "%OBJ_DIR%"

set	RESULT_DIR=..\result
if not exist "%RESULT_DIR%" mkdir "%RESULT_DIR%"
set RESULT_DIR=result\
if "%BASE_DIR%"=="" set BASE_DIR=..\..\..\
pushd %OBJ_DIR%

if exist "%ERR_FILE%" del %ERR_FILE%
set RESULT_NAME=result_%NAME_CC%.csv
set RESULT_FILE=%BASE_DIR%%RESULT_DIR%%RESULT_NAME%
if exist %RESULT_FILE% del %RESULT_FILE%

%DISP_VER%>version.tmp
%DISP_VER2% version.tmp
echo [= test-program =] , %NAME_CC:_= % >>%RESULT_FILE%

echo option , %O_CPP% %O_CC% >>%RESULT_FILE%
call :TEST_3	c	plain_char_is_signed	"fail[c]"	"unsigned"	"signed"
call :TEST_SZ	c	char_bit_size
call :TEST_SZ	c	sizeof_char
call :TEST_SZ	c	sizeof_short
call :TEST_SZ	c	sizeof_int
call :TEST_SZ	c	sizeof_long
call :TEST_SZ	c	sizeof_ptr
call :TEST_SZ	c	sizeof_float
call :TEST_SZ	c	sizeof_double
call :TEST_SZ	c	sizeof_longdouble
call :TEST_1	c	short_int
call :TEST_1	c	unsigned_short_int
call :TEST_1	c	unsigned_int
call :TEST_1	c	long_int
call :TEST_1	c	unsigned_long_int
call :TEST_1	c	cmp_int_uint
call :TEST_SZ	c	m1div4294967295
call :TEST_1	c	macro_ifdef
call :TEST_1	c	macro_define
call :TEST_1	c	macro_file_line
call :TEST_1	c	bitfield
call :TEST_1	c	local_var_init
call :TEST_1	c	local_block_var
call :TEST_1	c	local_static_var
call :TEST_1	c	local_block_static_var
call :TEST_1	c	union
call :TEST_1	c	struct1
call :TEST_1	c	struct2
call :TEST_1ABL	c	number_of_int32_without_l
call :TEST_1ABL	c	number_of_uint32_without_ul
call :TEST_1ABL	c	number_of_int64_without_ll
call :TEST_1ABL	c	number_of_uint64_without_ull
echo [KR-C] , >>%RESULT_FILE%
call :CMPL_1	kr	extern_in_func
call :TEST_1ABL	kr	oct0809
echo [c90] , >>%RESULT_FILE%
call :TEST_SZ	c90	sizeof_signed_char
call :TEST_SZ	c90	sizeof_unsigned_char
call :TEST_SZ	c90	sizeof_wide_ch
call :TEST_3	c90	sizeof_is_unsigned	"fail[c]"	"fail[signed]"	"pass"
call :TEST_1	c90	number_of_uint
call :TEST_1	c90	number_of_long
call :TEST_1	c90	number_of_ulong
call :TEST_1	c90	number_of_flt
call :TEST_1	c90	number_of_ldbl
call :TEST_1	c90	macro_bsl_join
call :TEST_1	c90	macro_if
call :TEST_1	c90	macro_elif
call :TEST_1	c90	macro_defined
call :TEST_1	c90	macro_pragma
call :TEST_1	c90	macro_to_str
call :TEST_1	c90	macro_cat
call :TEST_1	c90	macro_tok_cat
call :TEST_1	c90	comment_to_spc
call :TEST_1	c90	str_join
call :TEST_1	c90	entry
call :TEST_1	c90	enum
call :TEST_1	c90	func_arg_struct
call :TEST_1	c90	func_arg_ppp
call :TEST_1	c90	func_ptr_call
call :TEST_1	c90	plus
call :TEST_1	c90	switch_long
call :TEST_1	c90	struct_ini_comma
call :TEST_1	c90	struct_copy
call :TEST_1	c90	struct_local_ini
call :TEST_1	c90	struct_of_funcResult
call :TEST_1	c90	union_ini
call :TEST_1	c90	union_local_ini
call :TEST_1	c90	const_var
call :TEST_1	c90	volatile_var
call :TEST_1	c90	void_arg
call :TEST_1	c90	const_volatile_var
call :TEST_1	c90	wide_char
call :TEST_1	c90	wide_cstr
call :TEST_1	c90	wide_cstr_join
echo [c99] , >>%RESULT_FILE%
echo c99 option , %O_C99% >>%RESULT_FILE%
call :TEST_SZ	c99	sizeof_llong
call :TEST_SZ	c99	sizeof_ullong
call :TEST_1	c99	number_of_llong
call :TEST_1	c99	number_of_ullong
call :TEST_1	c99	switch_llong
call :TEST_1	c99	enum_ini_comma
call :TEST_1	c99	mod_minus
call :TEST_SZ	c99	m1div4294967295
call :TEST_1	c99	struct_memb_array_0
call :TEST_1	c99	line_comment
call :TEST_1	c99	line_comment_bsl_join
call :TEST_1ABL	c99	macro_empty_arg1
call :TEST_1	c99	macro_empty_arg2
call :TEST_1	c99	macro_va
call :TEST_1	c99	macro_va_2
call :TEST_1	c99	__func__
call :TEST_1	c99	_Pragma
call :TEST_1	c99	inline_func
call :TEST_1	c99	wide_cstr_join99
call :TEST_1	c99	hexfloat
call :TEST_1	c99	compound_literal
call :TEST_1	c99	local_def_var
call :TEST_1	c99	for_def_var
call :TEST_1	c99	unicode_esc_char
call :TEST_1	c99	var_name_esc_unicode
echo [c11] , >>%RESULT_FILE%
echo c11 option , %O_C11% >>%RESULT_FILE%
call :TEST_1	c11	dup_typedef
call :TEST_1	c11	anonymous_struct_in_union
call :TEST_1	c11	anonymous_union_in_struct
call :TEST_1	c11	u8str
call :TEST_1	c11	u16str
call :TEST_1	c11	u32str
echo [Japanese] , >>%RESULT_FILE%
echo SJIS option , %O_SJIS% >>%RESULT_FILE%
call :TEST_JP	c90	wide_char_sjis
call :TEST_1	c90	wide_char_utf8
call :TEST_JP	c90	wide_cstr_sjis
call :TEST_1	c90	wide_cstr_utf8
call :TEST_JP	c99	line_comment_sjis
call :TEST_1	c99	var_name_utf8
call :TEST_1	c99	var_name_sjis
call :TEST_1	c99	macro_name_utf8
call :TEST_1	c99	macro_name_sjis
echo [c++] , >>%RESULT_FILE%
call :TEST_1ABL	c++	int_main_no_return
echo [vc/gcc extention] , >>%RESULT_FILE%
call :TEST_SZ	vc	sizeof_m128
call :TEST_1ABL	vc	__restrict
call :TEST_1ABL	gcc	__FUNCTION__
call :TEST_1ABL	vc	__COUNTER__
if "%DOS16_MODE%"=="" (
 copy %BASE_DIR%vc\pragma_once.h .\
 call :TEST_1ABL vc	pragma_once
) else (
 copy %BASE_DIR%vc\pragma_1.h .\
 call :TEST_DOS	vc	pragma_1	pragma_once
)
echo [vc extention] , >>%RESULT_FILE%
call :TEST_1ABL	vc	void_main_return_0
call :TEST_SZ	vc	sizeof_int64
call :TEST_SZ	vc	sizeof_unsigned_int64
call :TEST_1ABL	vc	__cdecl
call :TEST_1ABL	vc	__stdcall
call :TEST_1ABL	vc	__fastcall
call :TEST_1ABL	vc	__forceinline
call :TEST_1ABL	vc	declspec_noinline
call :TEST_2ABL	vc	declspec_selectany	declspec_selectany_sub
call :TEST_1ABL	vc	declspec_align
call :TEST_1ABL	vc	declspec_noreturn
call :TEST_1ABL	vc	declspec_thread
call :CMPL_1	vc	declspec_dllimport
call :CMPL_1	vc	declspec_dllexport
call :TEST_INC1	vc	include_intrin		_intrin
call :TEST_1ABL	vc	_InterLockedIncrement
call :TEST_1ABL	vc	_InterLockedExchange
call :TEST_1ABL	vc	_ReadWriteBarrier
call :TEST_1ABL	vc	_ByteSwap
call :TEST_1ABL	vc	_BitScan
call :TEST_1ABL	vc	_BitScan64
call :TEST_1ABL	vc	__FUNCSIG__
call :TEST_1ABL	vc	__FUNCDNAME__
call :TEST_1ABL	vc	__pragma
echo [gcc extention] , >>%RESULT_FILE%
call :TEST_SZ	gcc	sizeof_int128
call :TEST_1ABL	gcc	switch_i128
call :TEST_1ABL	gcc	binary_literal
call :TEST_1ABL	gcc	attribute_alias
call :TEST_1ABL	gcc	attribute_always_inline
call :TEST_1ABL	gcc	attribute_noinline
call :TEST_2ABL	gcc	attribute_selectany	attribute_selectany_sub
call :TEST_2ABL	gcc	attribute_weak	attribute_weak_sub
call :TEST_1ABL	gcc	attribute_aligned
call :TEST_1ABL	gcc	attribute_noreturn
call :TEST_1ABL	gcc	__thread_var
call :TEST_1ABL	gcc	__sync_add_and_fetch
call :TEST_1ABL	gcc	__sync_val_compare_and_swap
call :TEST_1ABL	gcc	__builtin_bswap16
call :TEST_1ABL	gcc	__builtin_bswap3264
call :TEST_1ABL	gcc	__builtin_clz
call :TEST_1ABL	gcc	__builtin_clzll
call :TEST_1ABL	gcc	__PRETTY_FUNCTION__
call :TEST_1ABL	gcc	include_next
echo  , >>%RESULT_FILE%
echo [= not compatible with c++ =] , >>%RESULT_FILE%
call :TEST_SZ	c	sizeof_ch
call :TEST_1CO	kr	old_style_func
call :TEST_1ABL	kr	ref_register
call :TEST_1CO	c	default_type
call :TEST_1CO	c	multi_def_var
call :TEST_1CO	c	auto
call :TEST_1CO	c	struct3
call :TEST_1CO	c	struct4
call :TEST_1CO	c	struct_struct
call :TEST_1CO	c	recersive_main
call :PRI_1	c	sizeof_comma_op
echo [c90] , >>%RESULT_FILE%
call :TEST_1CO	c90	void_ptr
call :TEST_1CO	c90	const_var_unini
call :TEST_1CO	c90	char_array_no_null
call :TEST_1CO	c90	ref_array
call :TEST_1CO	c90	enum_var_set
call :TEST_1CO	c90	struct_def_func_ret
call :TEST_1CO	c90	struct_def_func_arg
echo [c99] , >>%RESULT_FILE%
call :PRI_1	c99	__STDC_VERSION__
call :PRI_1	c99	__STDC_ISO_10646__
call :PRI_1	c99	__STDC_IEC_559__
call :PRI_1	c99	__STDC_IEC_559_COMPLEX__
call :PRI_1	c99	__STDC_MB_MIGHT_NEQ_WC__
call :TEST_SZ	c99	sizeof_Bool
call :TEST_SZ	c99	sizeof_float_Complex
call :TEST_SZ	c99	sizeof_double_Complex
call :TEST_SZ	c99	sizeof_long_double_Complex
call :TEST_SZ	c99	sizeof_float_Imaginary
call :TEST_SZ	c99	sizeof_double_Imaginary
call :TEST_SZ	c99	sizeof_long_double_Imaginary
call :TEST_1CO	c99	designated_ini
call :TEST_1CO	c99	array_ini
call :TEST_1CO	c99	compound_literal_arg
call :TEST_1CO	c99	variable_length_array
call :TEST_1CO	c99	variable_length_array_sizeof
call :TEST_1CO	c99	variable_length_array_typedef
call :TEST_1CO	c99	variable_length_array_funcarg
call :TEST_1CO	c99	variable_length_array_funcarg2
call :TEST_1CO	c99	restrict_ptr
call :TEST_1CO	c99	array_type_qualifiers
call :TEST_1CO	c99	c99namescope
call :TEST_1CO	c99	c99namescope2
echo [c11] , >>%RESULT_FILE%
call :PRI_1	c11	__STDC_VERSION__
call :PRI_1	c11	__STDC_NO_ATOMICS__
call :PRI_1	c11	__STDC_NO_COMPLEX__
call :PRI_1	c11	__STDC_NO_THREADS__
call :PRI_1	c11	__STDC_NO_VLA__
call :PRI_1	c11	__STDC_ANALYZABLE__
call :PRI_1	c11	__STDC_UTF_16__
call :PRI_1	c11	__STDC_UTF_32__
call :PRI_1	c11	__STDC_LIB_EXT1__
call :TEST_1CO	c11	_Static_assert
call :TEST_1CO	c11	_Noreturn
call :TEST_1CO	c11	_Alignas
call :TEST_1CO	c11	_Alignof
call :TEST_1CO	c11	_Atomic
call :TEST_1CO	c11	_Thread_local
call :TEST_1CO	c11	_Generic
echo [gcc extention] , >>%RESULT_FILE%
call :TEST_1ABL	gcc	_Complex_number_i
call :TEST_1ABL	gcc	_Complex_real_imag
:L_EXI
popd
goto L_END

:CMPL_1
	set MSG_FAIL_C=no support
	set MSG_PASS=enable
	goto CMPL_C
rem :CMPL_2
rem	set MSG_FAIL_C=%~3
rem	set MSG_PASS=%~4
:CMPL_C
	set ADD_OPT=%O_CO%
	call :Compile1 %1 %2
	if not "%errorlevel%"=="0" exit /b 1
	echo %TTL% , %MSG_PASS% 1>>%RESULT_FILE%
	exit /b 0

:TEST_JP
	set ADD_OPT=%O_SJIS%
	set MSG_FAIL_C=fail[c]
	set MSG_FAIL_E=fail[e]
	set MSG_PASS=pass
	goto TEST_C

:TEST_1CO
	set ADD_OPT=
	if "%CPP_MODE%"=="" (
	  set MSG_FAIL_C=fail[c]
	  set MSG_FAIL_E=fail[e]
	  set MSG_PASS=pass
	) else (
	  set MSG_FAIL_C=no support
	  set MSG_FAIL_E=fail[e]
	  set MSG_PASS=enable
	)
	goto TEST_C

:TEST_2ABL
	set ADD_OPT=
	set MSG_FAIL_C=no support
	set MSG_FAIL_E=disable[e]
	set MSG_PASS=enable
	set ADD_FILE1=%3
	goto TEST_C

:TEST_DOS
	set ORIG_NAME=%3

:TEST_1ABL
	set ADD_OPT=
	set MSG_FAIL_C=no support
	set MSG_FAIL_E=disable[e]
	set MSG_PASS=enable
	goto TEST_C

:TEST_1
	set ADD_OPT=
	set MSG_FAIL_C=fail[c]
	set MSG_FAIL_E=fail[e]
	set MSG_PASS=pass
	goto TEST_C

:TEST_3
	set ADD_OPT=
	set MSG_FAIL_C=%~3
	set MSG_FAIL_E=%~4
	set MSG_PASS=%~5
	goto TEST_C

:TEST_C
	call :Compile1 %1 %2
	if not "%errorlevel%"=="0" exit /b 1
	%RUN% %NM%.exe
	if not "%errorlevel%"=="0" (
		echo %TTL% , %MSG_FAIL_E% 1>>%RESULT_FILE%
		exit /b 2
	)
	echo %TTL% , %MSG_PASS% 1>>%RESULT_FILE%
	exit /b 0

:TEST_SZ
	set MSG_FAIL_C=no support
	set MSG_FAIL_E=fail[e]
	set MSG_PASS=pass
	set ADD_OPT=
	call :Compile1 %1 %2
	if not "%errorlevel%"=="0" exit /b 1
	%RUN% %NM%.exe
	echo %TTL% , %errorlevel% 1>>%RESULT_FILE%
	exit /b 0

:PRI_1
	set MSG_FAIL_C=fail[c]
	set MSG_FAIL_E=fail[e]
	set MSG_PASS=pass
	set ADD_OPT=
	call :Compile1 %1 %2
	if not "%errorlevel%"=="0" exit /b 1
	%RUN% %NM%.exe 1>>%RESULT_FILE%
	if not "%errorlevel%"=="0" (
	  echo %TTL% , %MSG_FAIL_E% 1>>%RESULT_FILE%
	)
	exit /b 0

:TEST_INC1
	set MSG_FAIL_C=no support
	set MSG_FAIL_E=disable[e]
	set MSG_PASS=enable
	set ADD_OPT=
	echo /*dummy*/ 1>%3.h
	call :Compile1 %1 %2
	if not "%errorlevel%"=="0" exit /b 1
	%RUN% %NM%.exe 1>%3.h
	if not "%errorlevel%"=="0" (
		echo %TTL% , %MSG_FAIL_E% 1>>%RESULT_FILE%
		exit /b 2
	)
	echo %TTL% , %MSG_PASS% 1>>%RESULT_FILE%
	exit /b 0

:Compile1
	echo # %1 %2 2>>cons
	set NM=%2
	set TTL=%1/%2.%CEXT%
	if "%1"=="c99" set ADD_OPT=%O_C99% %ADD_OPT%
	if "%1"=="c11" set ADD_OPT=%O_C11% %ADD_OPT%
	set O_OE_NAME=
	if "%DOS16_MODE%"=="1" goto Compile1_dos16

	set FNM=%2.%CEXT%
	set DSTFNM=%2.%CEXT%
	if not "%DSTEXT%"=="" set DSTFNM=%2.%DSTEXT%
	set DIR_FN=%BASE_DIR%%1\%FNM%

	set FNM2=
	set DSTFNM2=
	set DIR_FN2=
	if not "%ADD_FILE1%"=="" (
		set FNM2=%ADD_FILE1%.%CEXT%
		set DSTFNM2=%ADD_FILE1%.%CEXT%
		if not "%DSTEXT%"=="" set DSTFNM2=%ADD_FILE1%.%DSTEXT%
		set DIR_FN2=%BASE_DIR%%1\%FNM2%
	)
	set ADD_FILE1=

	if not "%O_OE%"=="" set O_OE_NAME=%O_OE%%NM%.exe
	if "%SRCCOPY_MODE%"=="" (
		%RUN% %CC% %O_OE_NAME% %O_CC% %ADD_OPT% %DIR_FN% %DIR_FN2% %O_CC2% %ERN%>>%ERR_FILE%
	) else (
		copy %DIR_FN% .\%DSTFNM%
		if not "%DIR_FN2%"=="" copy %DIR_FN2% .\%DSTFNM2%
		%RUN% %CC% %O_OE_NAME% %O_CC% %ADD_OPT% %DSTFNM% %DSTFNM2% %O_CC2% %ERN%>>%ERR_FILE%
	)
	if not "%errorlevel%"=="0" (
		echo %TTL% , %MSG_FAIL_C% 1>>%RESULT_FILE%
		exit /b 1
	)
	exit /b 0

:Compile1_dos16
	set /a COUNT=COUNT+1
	set FNM=%COUNT%.%CEXT%
	set FNM2=
	set NM=%COUNT%
	if not "%O_OE%"=="" set O_OE_NAME=%O_OE%%NM%.exe
	if not "%ORIG_NAME%"=="" (
		set TTL=%1/%ORIG_NAME%.%CEXT%
	)
	set ORIG_NAME=
	copy /b "%BASE_DIR%%1\%2.%CEXT%" .\%FNM%
	if not "%ADD_FILE1%"=="" (
	  set FNM2=%COUNT%b.%CEXT%
	  copy /b "%BASE_DIR%%1\%ADD_FILE1%.%CEXT%" .\%COUNT%b.%CEXT%
	  set ADD_FILE1=
	)
	%RUN% %CC% %O_OE_NAME% %O_CC% %ADD_OPT% %FNM% %FNM2% %O_CC2% %ERN%>>%ERR_FILE%
	if not "%errorlevel%"=="0" (
		echo %TTL% , %MSG_FAIL_C% 1>>%RESULT_FILE%
		exit /b 1
	)
	exit /b 0


:L_CLEAN
	del /s *.obj
	del /s *.o
	del /s *.tds
	del /s *.err
	del /s *.map
	del /s *.rel
	del /s *.ilk
	del /s *.pdb
	del /s *.idb
	del /s *.exe
	goto L_END

:L_END
endlocal
