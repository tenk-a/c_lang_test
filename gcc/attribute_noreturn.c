#ifdef __cplusplus
#include <stdlib.h>
#endif
__attribute__((noreturn)) void e() { exit(0); }

int main() {
    e();
    return 1;
}
