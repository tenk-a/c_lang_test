#if defined(__cplusplus)
#include <stdio.h>
#endif
#define M_TO_S(x)       M_TO_S2(0,x)
#define M_TO_S2(dmy,x)  #x

int main() {
 #ifdef __STDC_NO_ATOMICS__
    printf("c11/__STDC_NO_ATOMICS__.c, %s\n", M_TO_S(__STDC_NO_ATOMICS__));
 #else
    printf("c11/__STDC_NO_ATOMICS__.c , no support\n");
 #endif
    return 0;
}
