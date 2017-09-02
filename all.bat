rem hung-up
call setcc   tinyc64
call cl_test tinyc    Tiny_C_0.96_x64
call setcc   orangec
call cl_test orangec  Orange_C_5.0.7.1
call setcc   lccwin
call cl_test lccwin64 lccwin64_3.8

rem no hung
call setcc   vc71
call cl_test vc       vc7.1
call cl_test vc++     vc++7.1
call setcc   vc8
call cl_test vc       vc8
call cl_test vc++     vc++8
call setcc   vc9
call cl_test vc       vc9
call cl_test vc++     vc++9
call setcc   vc11
call cl_test vc       vc11
call cl_test vc++     vc++11
call setcc   vc11x64
call cl_test vc       vc11_x64
call cl_test vc++     vc++11_x64
rem call setcc   vc12
rem call cl_test vc       vc12
rem call cl_test vc++     vc++12
rem call setcc   vc12x64
rem call cl_test vc       vc12_x64
rem call cl_test vc++     vc++12_x64
call setcc   tdm32
call cl_test mingw    mingw_gcc_4.7.1_tdm
call cl_test mingw++  mingw_g++_4.7.1_tdm
call setcc   tdm64
call cl_test mingw    mingw64_gcc_4.7.1_tdm
call cl_test mingw++  mingw64_g++_4.7.1_tdm
call setcc   mingw_345
call cl_test mingw    mingw_gcc_3.4.5
call cl_test mingw++  mingw_g++_3.4.5
call setcc   dmc
call cl_test dmc      dmc_v.8.56
call cl_test dmc++    dmc++_v.8.56
call setcc   ow
call cl_test ow       Open_Watcom_C_v.1.9
call cl_test ow++     Open_Watcom_C++_v.1.9
call setcc   bcc
call cl_test bcc      Borland_C_v5.5.1
call cl_test bcc++    Borland_C++_v5.5.1
call setcc   tinyc
call cl_test tinyc    Tiny_C_0.96
call setcc   pcc
call cl_test pcc      pcc_2011_12_06_win32
call setcc   pellesc64
call cl_test pellesc64  Pelles_C_7.00.25_x64
call setcc   lcc
call cl_test lcc      lcc_4.2_mod_with_vc
call setcc   coins
call cl_test coins    coins_1.4.5.2_en_with_cygwin_gcc_3.4.4
goto :EOF
call setcc   clang
call cl_test clang    clang_3.2_+mingw
call cl_test clang++  clang++_3.2_+mingw
