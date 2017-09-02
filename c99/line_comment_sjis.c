int table0[] = {0,1,2,3};
int table[]  = {1,2,3,0};
// (SJIS未対応で行末に'\x5c'を含む全角文字があると次行コメント化) 適当な表
#define table   table0

int main() {
    return table[0];
}
