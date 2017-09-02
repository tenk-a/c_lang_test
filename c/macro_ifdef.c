#ifndef RC
#define RC  0
#endif
int main() {
# ifdef RC
    return RC;
# else
    return 1;
# endif
}
