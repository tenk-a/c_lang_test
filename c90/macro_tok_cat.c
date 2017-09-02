#define MAC_TOK_CAT(a,b)    MAC_TOK_CAT2(a,b)
#define MAC_TOK_CAT2(a,b)   a##b

#define HOGE                hoge_
#define ABCD                abcd
#define hoge_abcd           hogeAbcd

int main() {
    int hogeAbcd;
    hogeAbcd = 0;
    return MAC_TOK_CAT(HOGE, ABCD);
}
