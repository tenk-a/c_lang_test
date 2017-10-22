#
ERR_FILE=err.txt

ini_cc() {
  CMD_CC=cc
}

ini_pcc() {
  CMD_CC=pcc
}

ini_gcc_pp() {
  CMD_CC="g++"
  O_C99="-std=c++11"
  O_C11="-std=c++11"
  O_CPP11="-std=c++11"
  O_SJIS="-finput-charset=cp932 -fexec-charset=cp932"
  CPP_MODE=1
}

ini_gcc() {
  CMD_CC="gcc"
  O_C99="-std=c99"
  O_C11="-std=c11"
  O_SJIS="-finput-charset=cp932 -fexec-charset=cp932"
}

ini_clang_pp() {
  CMD_CC="clang++"
  O_C99="-std=c++11"
  O_C11="-std=c++11"
  O_CPP11="-std=c++11"
  CPP_MODE=1
}

ini_clang() {
  CMD_CC="clang"
  O_C99="-std=c99"
  O_C11="-std=c11"
}

test_all() {
	echo "C Language Feature Test"
	echo "   target=$compi"

	OBJ_DIR="obj/$compi"
	BASE_DIR="../../.."
	if [ ! -e "obj" ] ; then
	  mkdir "obj"
	fi
	if [ ! -e "obj/$compi" ] ; then
	  mkdir "obj/$compi"
	fi

	pushd "obj/$compi"

	if [ -e "$ERR_FILE" ] ; then
		rm $ERR_FILE
	fi
	RESULT_NAME=result_$NAME_CC.csv
	RESULT_FILE=$BASE_DIR/$RESULT_NAME

	echo "[= test-program =] , $NAME_CC" >$RESULT_FILE

	echo "option , $O_CPP $O_CC $O_CC2" >>$RESULT_FILE
	TEST_3		c	plain_char_is_signed	"fail[c]"	"unsigned"	"signed"
	TEST_SZ		c	char_bit_size
	TEST_SZ		c	sizeof_char
	TEST_SZ		c	sizeof_short
	TEST_SZ		c	sizeof_int
	TEST_SZ		c	sizeof_long
	TEST_SZ		c	sizeof_ptr
	TEST_SZ		c	sizeof_float
	TEST_SZ		c	sizeof_double
	TEST_SZ		c	sizeof_longdouble
	TEST_1		c	short_int
	TEST_1		c	unsigned_short_int
	TEST_1		c	unsigned_int
	TEST_1		c	long_int
	TEST_1		c	unsigned_long_int
	TEST_1		c	cmp_int_uint
	TEST_SZ		c	m1div4294967295
	TEST_1		c	macro_ifdef
	TEST_1		c	macro_define
	TEST_1		c	macro_file_line
	TEST_1		c	bitfield
	TEST_1		c	local_var_init
	TEST_1		c	local_block_var
	TEST_1		c	local_static_var
	TEST_1		c	local_block_static_var
	TEST_1		c	union
	TEST_1		c	struct1
	TEST_1		c	struct2
	TEST_1ABL	c	number_of_int32_without_l
	TEST_1ABL	c	number_of_uint32_without_ul
	TEST_1ABL	c	number_of_int64_without_ll
	TEST_1ABL	c	number_of_uint64_without_ull
	echo "[KR-C] ," >>$RESULT_FILE
	CMPL_1		kr	extern_in_func
	TEST_1ABL	kr	oct0809
	echo "[c90] ," >>$RESULT_FILE
	TEST_SZ		c90	sizeof_signed_char
	TEST_SZ		c90	sizeof_unsigned_char
	TEST_SZ		c90	sizeof_wide_ch
	TEST_3		c90	sizeof_is_unsigned	"fail[c]"	"fail[signed]"	"pass"
	TEST_1		c90	number_of_uint
	TEST_1		c90	number_of_long
	TEST_1		c90	number_of_ulong
	TEST_1		c90	number_of_flt
	TEST_1		c90	number_of_ldbl
	TEST_1		c90	macro_bsl_join
	TEST_1		c90	macro_if
	TEST_1		c90	macro_elif
	TEST_1		c90	macro_defined
	TEST_1		c90	macro_pragma
	TEST_1		c90	macro_to_str
	TEST_1		c90	macro_cat
	TEST_1		c90	macro_tok_cat
	TEST_1		c90	comment_to_spc
	TEST_1		c90	str_join
	TEST_1		c90	entry
	TEST_1		c90	enum
	TEST_1		c90	func_arg_struct
	TEST_1		c90	func_arg_ppp
	TEST_1		c90	func_ptr_call
	TEST_1		c90	plus
	TEST_1		c90	switch_long
	TEST_1		c90	struct_ini_comma
	TEST_1		c90	struct_copy
	TEST_1		c90	struct_local_ini
	TEST_1		c90	struct_of_funcResult
	TEST_1		c90	union_ini
	TEST_1		c90	union_local_ini
	TEST_1		c90	const_var
	TEST_1		c90	volatile_var
	TEST_1		c90	void_arg
	TEST_1		c90	const_volatile_var
	TEST_1		c90	wide_char
	TEST_1		c90	wide_cstr
	TEST_1		c90	wide_cstr_join
	echo "[c99] ," >>$RESULT_FILE
	echo "c99 option , $O_C99" >>$RESULT_FILE
	TEST_SZ		c99	sizeof_llong
	TEST_SZ		c99	sizeof_ullong
	TEST_1		c99	number_of_llong
	TEST_1		c99	number_of_ullong
	TEST_1		c99	switch_llong
	TEST_1		c99	enum_ini_comma
	TEST_1		c99	mod_minus
	TEST_SZ 	c99	m1div4294967295
	TEST_1		c99	struct_memb_array_0
	TEST_1		c99	line_comment
	TEST_1		c99	line_comment_bsl_join
	TEST_1ABL	c99	macro_empty_arg1
	TEST_1		c99	macro_empty_arg2
	TEST_1		c99	macro_va
	TEST_1		c99	macro_va_2
	TEST_1		c99	__func__
	TEST_1		c99	_Pragma
	TEST_1		c99	inline_func
	TEST_1		c99	wide_cstr_join99
	TEST_1		c99	hexfloat
	TEST_1		c99	compound_literal
	TEST_1		c99	local_def_var
	TEST_1		c99	for_def_var
	TEST_1		c99	unicode_esc_char
	TEST_1		c99	var_name_esc_unicode
	echo "[c11] ," >>$RESULT_FILE
	echo "c11 option , $O_C11" >>$RESULT_FILE
	TEST_1		c11	dup_typedef
	TEST_1		c11	anonymous_struct_in_union
	TEST_1		c11	anonymous_union_in_struct
	TEST_1		c11	u8str
	TEST_1		c11	u16str
	TEST_1		c11	u32str
	echo "[Japanese] ," >>$RESULT_FILE
	echo "SJIS option , $O_SJIS" >>$RESULT_FILE
	TEST_JP		c90	wide_char_sjis
	TEST_1		c90	wide_char_utf8
	TEST_JP		c90	wide_cstr_sjis
	TEST_1		c90	wide_cstr_utf8
	TEST_JP		c99	line_comment_sjis
	TEST_1		c99	var_name_utf8
	TEST_1		c99	var_name_sjis
	TEST_1		c99	macro_name_utf8
	TEST_1		c99	macro_name_sjis
	echo "[c++] ," >>$RESULT_FILE
	TEST_1ABL	c++	void_main_return_0
	echo [vc/gcc extention] , >>%RESULT_FILE%
	TEST_SZ 	vc	sizeof_m128
	TEST_1ABL	vc	__restrict
	TEST_1ABL	gcc	__FUNCTION__
	TEST_1ABL	vc	__COUNTER__
 	TEST_1ABL	vc	pragma_once
	echo "[vc extention] ," >>$RESULT_FILE
	TEST_SZ		vc	sizeof_int64
	TEST_SZ		vc	sizeof_unsigned_int64
	TEST_1ABL	vc	__cdecl
	TEST_1ABL	vc	__stdcall
	TEST_1ABL	vc	__fastcall
	TEST_1ABL	vc	__forceinline
	TEST_1ABL	vc	declspec_noinline
	TEST_2ABL	vc	declspec_selectany	declspec_selectany_sub
	TEST_1ABL	vc	declspec_align
	TEST_1ABL	vc	declspec_noreturn
	TEST_1ABL	vc	declspec_thread
	CMPL_1		vc	declspec_dllimport
	CMPL_1		vc	declspec_dllexport
	TEST_1ABL	vc	_InterLockedIncrement
	TEST_1ABL	vc	_InterLockedExchange
	TEST_1ABL	vc	_ReadWriteBarrier
	TEST_1ABL	vc	_ByteSwap
	TEST_1ABL	vc	_BitScan
	TEST_1ABL	vc	_BitScan64
	TEST_1ABL	vc	__FUNCSIG__
	TEST_1ABL	vc	__FUNCDNAME__
	TEST_1ABL	vc	__pragma
	echo "[gcc extention] ," >>$RESULT_FILE
	TEST_SZ		gcc	sizeof_int128
	TEST_1ABL	gcc	switch_i128
	TEST_1ABL	gcc	binary_literal
	TEST_1ABL	gcc	attribute_alias
	TEST_1ABL	gcc	attribute_always_inline
	TEST_1ABL	gcc	attribute_noinline
	TEST_2ABL	gcc	attribute_selectany	attribute_selectany_sub
	TEST_2ABL	gcc	attribute_weak	attribute_weak_sub
	TEST_1ABL	gcc	attribute_aligned
	TEST_1ABL	gcc	attribute_noreturn
	TEST_1ABL	gcc	__thread_var
	TEST_1ABL	gcc	__sync_add_and_fetch
	TEST_1ABL	gcc	__sync_val_compare_and_swap
	TEST_1ABL	gcc	__builtin_bswap16
	TEST_1ABL	gcc	__builtin_bswap3264
	TEST_1ABL	gcc	__builtin_clz
	TEST_1ABL	gcc	__builtin_clzll
	TEST_1ABL	gcc	__PRETTY_FUNCTION__
	TEST_1ABL	gcc	include_next
	echo " ," >>$RESULT_FILE
	echo "[= not compatible with c++ =] ," >>$RESULT_FILE
	TEST_SZ		c	sizeof_ch
	TEST_1CO	kr	old_style_func
	TEST_1ABL	kr	ref_register
	TEST_1CO	c	default_type
	TEST_1CO	c	multi_def_var
	TEST_1CO	c	auto
	TEST_1CO	c	struct3
	TEST_1CO	c	struct4
	TEST_1CO	c	struct_struct
	TEST_1CO	c	recersive_main
	PRI_1		c	sizeof_comma_op
	echo "[c90] ," >>$RESULT_FILE
	TEST_1CO	c90	void_ptr
	TEST_1CO	c90	const_var_unini
	TEST_1CO	c90	char_array_no_null
	TEST_1CO	c90	ref_array
	TEST_1CO	c90	enum_var_set
	TEST_1CO	c90	struct_def_func_ret
	TEST_1CO	c90	struct_def_func_arg
	echo "[c99] ," >>$RESULT_FILE
	PRI_1		c99	__STDC_VERSION__
	PRI_1		c99	__STDC_ISO_10646__
	PRI_1		c99	__STDC_IEC_559__
	PRI_1		c99	__STDC_IEC_559_COMPLEX__
	PRI_1		c99	__STDC_MB_MIGHT_NEQ_WC__
	TEST_SZ		c99	sizeof_Bool
	TEST_SZ		c99	sizeof_float_Complex
	TEST_SZ		c99	sizeof_double_Complex
	TEST_SZ		c99	sizeof_long_double_Complex
	TEST_SZ		c99	sizeof_float_Imaginary
	TEST_SZ		c99	sizeof_double_Imaginary
	TEST_SZ		c99	sizeof_long_double_Imaginary
	TEST_1CO	c99	designated_ini
	TEST_1CO	c99	array_ini
	TEST_1CO	c99	compound_literal_arg
	TEST_1CO	c99	variable_length_array
	TEST_1CO	c99	variable_length_array_sizeof
	TEST_1CO	c99	variable_length_array_typedef
	TEST_1CO	c99	variable_length_array_funcarg
	TEST_1CO	c99	variable_length_array_funcarg2
	TEST_1CO	c99	restrict_ptr
	TEST_1CO	c99	array_type_qualifiers
	TEST_1CO	c99	c99namescope
	TEST_1CO	c99	c99namescope2
	echo "[c11] ," >>$RESULT_FILE
	PRI_1		c11	__STDC_VERSION__
	PRI_1		c11	__STDC_NO_ATOMICS__
	PRI_1		c11	__STDC_NO_COMPLEX__
	PRI_1		c11	__STDC_NO_THREADS__
	PRI_1		c11	__STDC_NO_VLA__
	PRI_1		c11	__STDC_ANALYZABLE__
	PRI_1		c11	__STDC_UTF_16__
	PRI_1		c11	__STDC_UTF_32__
	PRI_1		c11	__STDC_LIB_EXT1__
	TEST_1CO	c11	_Static_assert
	TEST_1CO	c11	_Noreturn
	TEST_1CO	c11	_Alignas
	TEST_1CO	c11	_Alignof
	TEST_1CO	c11	_Atomic
	TEST_1CO	c11	_Thread_local
	TEST_1CO	c11	_Generic
	echo "[gcc extention] ," >>$RESULT_FILE
	TEST_1ABL	gcc	_Complex_number_i
	TEST_1ABL	gcc	_Complex_real_imag

	popd
	return 0
}

TEST_JP() {
	TEST_1 $1 $2 $O_SJIS
	return $?
}

TEST_1CO() {
	if [ Z"$CPP_MODE"=Z"" ] ; then
		TEST_1 $1 $2
	else
		TEST_1ABL $1 $2
	fi
	return $?
}

TEST_1ABL() {
	MSG_FAIL_C="no support"
	MSG_FAIL_E="disable[e]"
	MSG_PASS="enable"
	ADD_OPT=$3
	TEST_C $1 $2
	return $?
}

TEST_2ABL() {
	MSG_FAIL_C="no support"
	MSG_FAIL_E="disable[e]"
	MSG_PASS="enable"
	ADD_FILE1=$3
	TEST_C $1 $2
	return $?
}

TEST_1() {
	MSG_FAIL_C="fail[c]"
	MSG_FAIL_E="fail[e]"
	MSG_PASS="pass"
	ADD_OPT=$3
	TEST_C $1 $2
	return $?
}

TEST_3() {
	MSG_FAIL_C=$3
	MSG_FAIL_E=$4
	MSG_PASS=$5
	ADD_OPT=$6
	TEST_C $1 $2
	return $?
}

TEST_C() {
	Compile1 $1 $2
	if [ $? -ne 0 ] ; then
		return 1
	fi
	./$FNM
	if [ $? -ne 0 ] ; then
		echo $TTL , $MSG_FAIL_E 1>>$RESULT_FILE
		return 2
	fi
	echo $TTL , $MSG_PASS 1>>$RESULT_FILE
	return 0
}

TEST_SZ() {
	MSG_FAIL_C="no support"
	MSG_FAIL_E="fail[e]"
	MSG_PASS="pass"
	ADD_OPT=$3
	Compile1 $1 $2
	if [ $? -ne 0 ] ; then
		return 1
	fi
	./$FNM
	echo $TTL , $? 1>>$RESULT_FILE
	return 0
}

PRI_1() {
	MSG_FAIL_C="fail[c]"
	MSG_FAIL_E="fail[e]"
	MSG_PASS="pass"
	ADD_OPT=
	Compile1 $1 $2
	if [ $? -ne 0 ] ; then
		return 1
	fi
	./$FNM 1>>$RESULT_FILE
	if [ $? -ne 0 ] ; then
	  echo $TTL , $MSG_FAIL_E 1>>$RESULT_FILE
	fi
	return 0
}

CMPL_1() {
	MSG_FAIL_C="no support"
	MSG_PASS="pass"
	ADD_OPT=
	Compile1 $1 $2
	if [ $? -ne 0 ] ; then
		return 1
	fi
	echo $TTL , $MSG_PASS 1>>$RESULT_FILE
	return 0
}

Compile1() {
	if [ Z"$1"=Z"c99" ] ; then
		ADD_OPT="$O_C99 $ADD_OPT"
	fi
	if [ Z"$1"=Z"c11" ] ; then
		ADD_OPT="$O_C11 $ADD_OPT"
	fi
	FNM="$2"
	DIR_FN="$1/$2.c"
	TTL="$1/$2.c"
	FNM2=
	DIR_FN2=
	if [ -n "$ADD_FILE1" ] ; then
		FNM2="$ADD_FILE1.c"
		DIR_FN2="$BASE_DIR/$1/$FNM2"
	fi
	ADD_FILE1=
	O_OE_NAME="$O_OE$FNM"
	if [ Z"$SRCCOPY_MODE"=Z"" ] ; then
		$CMD_CC $O_OE_NAME $O_CC $ADD_OPT $BASE_DIR/$DIR_FN $DIR_FN2 $O_CC2 2>>$ERR_FILE
	else
		cp $BASE_DIR/$DIR_FN ./$FNM.c
		if [ -n $DIR_FN2 ] ; then
			cp $DIR_FN2 ./$FNM2
		fi
		$CMD_CC $O_OE_NAME $O_CC $ADD_OPT $FNM.c $FNM2 $O_CC2 2>>$ERR_FILE
	fi
	if [ $? -ne 0 ] ; then
		echo $TTL , $MSG_FAIL_C 1>>$RESULT_FILE
		return 1
	fi
	return 0
}

#

CMD_CC=
O_CC=
O_CC2=
O_OE=-o 
O_CO=-c
O_C99=
O_C11=
CPP_MODE=

compi=$1
echo $compi
if [ -z $compi ] ; then
	compi=cc
fi
NAME_CC=$2
if [ -z $NAME_CC ] ; then
	NAME_CC=$compi
fi

case "$compi" in
  "clang++") ini_clang_pp ;;
  "clang") ini_clang ;;
  "g++") ini_gcc_pp ;;
  "gcc") ini_gcc ;;
  "pcc") ini_pcc ;;
  "cc") ini_cc ;;
  *) exit 1 ;;
esac
test_all
exit 0
