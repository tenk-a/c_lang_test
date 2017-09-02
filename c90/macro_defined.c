#define LABEL1
#undef  LABEL2
#if defined(LABEL1) && !defined(LABEL2)
int a = 0;
#else
int a = 1;
#endif
int main() {
    return a;
}
