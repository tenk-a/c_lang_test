							       2013-06-16 tenk*
C言語機能の比較
http://www.6809.net/tenk/?C%E8%A8%80%E8%AA%9E%E6%A9%9F%E8%83%BD%E3%81%AE%E6%AF%94%E8%BC%83

で使ったサンプルソースやバッチ＆ツール.

buildディレクトリ

cl_test.bat [コンパイラ] [詳しいコンパイラ名]
	ソースをコンパイル＆実行して結果を result_???.csv に出力するバッチ.

	指定できるコンパイラは
		vc,vc++, mingw,mingw++, dmc,dmc++,ow,ow++,bcc,bcc++
		tinyc,tinyc64,pcc,orangec,coins,lsic64
		pellesc,pellesc64,lccwin,lccwin64,lcc
	詳しいコンパイラ名は、csv中のコンパイラ名と結果ファイル名に使う.
	必要に応じて修正すること前提.

cl_test.sh
	bash 用. gcc と clang のみ. cygwinまたはlinux用.
	(zip は win環境で圧縮してるので要chmod)
	必要に応じて修正すること前提.

setcc.bat
	コマンドライン環境用のコンパイラ設定.
	自分の環境にあわせて書き換える必要あり.

all.bat cc_lsic64.bat 等
	setcc.bat と cl_test.bat を組み合わせて複数のコンパイラをまとめて試す.
	(win8 x64では動かないコンパイラは 別途win2k環境等で試していたので
	 複数のバッチになってる)
	これも自分の持ってるコンパイラに合わせて必要に応じて書き換え.


z_for_my_siteディレクトリ(自分のサイト用)

tools/merge_cl_test_resluts.c ～.exe
	cl_test で生成した複数の結果をまとめるツール.
	出力は .csv か pyukiwiki 用テーブル. (うちのサイト専用)

gen4mypyukiwiki.bat merge_results.bat
	merge_cl_test_resluts.exe を使って頁 or csv を生成.
	brief_jp.csv にテストファイル名と内容を書いておく.



-------------------------------------------------------------------------------
2013-06-16	r.1
2013-06-16	r.2
・ m1div4294967295.c テスト追加.
・ cl_test.bat で g++ のC99,C11向けオプションとして -std=c++11 に
   し忘れていたのを修正.
・ cl_test.sh が少し古く抜けテストがあったのを修正.
・ tools/merge_cl_test_results.cpp 修正.
・ brief_jp.csv に補足説明を追加.
2013-07-03	r.3
・テスト追加 c11/dup_typedef.c
   gcc/ __builtin_bswap16.c __builtin_bswap3264.c sizeof_int128.c switch_i128.c
・vc 組込関数を使う場合のintrin.hの扱いの調整
  (intrin.hの存在チェックして_intrin.hを生成それをinclude)
・vc gcc 共通の拡張機能を [vc/gcc 拡張共通] としてまとめた.
・orange-c 関係の調整.
2014-01-05	r.4
・void main について誤解してたので、c++/void_main_return_0.c を vc/ に移動、
  int main で最後のreturn 無しチェック c++/int_main_no_return.c を追加.
2017-10-22
・ビルド・フォルダ＆バッチ関係の修正（途中）
