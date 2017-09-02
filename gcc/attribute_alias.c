#ifdef __cplusplus
extern "C" {
#endif

int a() { return 0; }
__attribute__((alias("a"))) int b();

#ifdef __cplusplus
}
#endif

int main() {
    return b();
}
