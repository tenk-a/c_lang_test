#ifdef __cplusplus
#include <stdlib.h>
#endif
__declspec(noreturn) void e() { exit(0); }

int main() {
    e();
    return 1;
}
