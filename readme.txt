							       2013-06-16 tenk*
C����@�\�̔�r
http://www.6809.net/tenk/?C%E8%A8%80%E8%AA%9E%E6%A9%9F%E8%83%BD%E3%81%AE%E6%AF%94%E8%BC%83

�Ŏg�����T���v���\�[�X��o�b�`���c�[��.

build�f�B���N�g��

cl_test.bat [�R���p�C��] [�ڂ����R���p�C����]
	�\�[�X���R���p�C�������s���Č��ʂ� result_???.csv �ɏo�͂���o�b�`.

	�w��ł���R���p�C����
		vc,vc++, mingw,mingw++, dmc,dmc++,ow,ow++,bcc,bcc++
		tinyc,tinyc64,pcc,orangec,coins,lsic64
		pellesc,pellesc64,lccwin,lccwin64,lcc
	�ڂ����R���p�C�����́Acsv���̃R���p�C�����ƌ��ʃt�@�C�����Ɏg��.
	�K�v�ɉ����ďC�����邱�ƑO��.

cl_test.sh
	bash �p. gcc �� clang �̂�. cygwin�܂���linux�p.
	(zip �� win���ň��k���Ă�̂ŗvchmod)
	�K�v�ɉ����ďC�����邱�ƑO��.

setcc.bat
	�R�}���h���C�����p�̃R���p�C���ݒ�.
	�����̊��ɂ��킹�ď���������K�v����.

all.bat cc_lsic64.bat ��
	setcc.bat �� cl_test.bat ��g�ݍ��킹�ĕ����̃R���p�C�����܂Ƃ߂Ď���.
	(win8 x64�ł͓����Ȃ��R���p�C���� �ʓrwin2k�����Ŏ����Ă����̂�
	 �����̃o�b�`�ɂȂ��Ă�)
	����������̎����Ă�R���p�C���ɍ��킹�ĕK�v�ɉ����ď�������.


z_for_my_site�f�B���N�g��(�����̃T�C�g�p)

tools/merge_cl_test_resluts.c �`.exe
	cl_test �Ő������������̌��ʂ��܂Ƃ߂�c�[��.
	�o�͂� .csv �� pyukiwiki �p�e�[�u��. (�����̃T�C�g��p)

gen4mypyukiwiki.bat merge_results.bat
	merge_cl_test_resluts.exe ���g���ĕ� or csv �𐶐�.
	brief_jp.csv �Ƀe�X�g�t�@�C�����Ɠ��e�������Ă���.



-------------------------------------------------------------------------------
2013-06-16	r.1
2013-06-16	r.2
�E m1div4294967295.c �e�X�g�ǉ�.
�E cl_test.bat �� g++ ��C99,C11�����I�v�V�����Ƃ��� -std=c++11 ��
   ���Y��Ă����̂��C��.
�E cl_test.sh �������Â������e�X�g���������̂��C��.
�E tools/merge_cl_test_results.cpp �C��.
�E brief_jp.csv �ɕ⑫������ǉ�.
2013-07-03	r.3
�E�e�X�g�ǉ� c11/dup_typedef.c
   gcc/ __builtin_bswap16.c __builtin_bswap3264.c sizeof_int128.c switch_i128.c
�Evc �g���֐����g���ꍇ��intrin.h�̈����̒���
  (intrin.h�̑��݃`�F�b�N����_intrin.h�𐶐������include)
�Evc gcc ���ʂ̊g���@�\�� [vc/gcc �g������] �Ƃ��Ă܂Ƃ߂�.
�Eorange-c �֌W�̒���.
2014-01-05	r.4
�Evoid main �ɂ��Č�����Ă��̂ŁAc++/void_main_return_0.c �� vc/ �Ɉړ��A
  int main �ōŌ��return �����`�F�b�N c++/int_main_no_return.c ��ǉ�.
2017-10-22
�E�r���h�E�t�H���_���o�b�`�֌W�̏C���i�r���j
