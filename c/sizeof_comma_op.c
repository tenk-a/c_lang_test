#if defined(__cplusplus)
#include <stdio.h>
#endif
int main() {
    char a[9];
    if (sizeof((char)0,a) == 9) {
        printf("c/sizeof_comma_op.c , lvalue\n");
        return 0;
    } else if (sizeof((char)0,a) == sizeof(char*)) {
        printf("c/sizeof_comma_op.c , rvalue\n");
        return 0;
    } else {
        /*printf("fail[e]\n");*/
        return 1;
    }
}
