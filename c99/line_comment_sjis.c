int table0[] = {0,1,2,3};
int table[]  = {1,2,3,0};
// (SJIS���Ή��ōs����'\x5c'���܂ޑS�p����������Ǝ��s�R�����g��) �K���ȕ\
#define table   table0

int main() {
    return table[0];
}
