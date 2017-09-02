#include <string.h>
#if defined(__cplusplus)
#include <stdio.h>
#endif
#define M_TO_S(x)       M_TO_S2(0,x)
#define M_TO_S2(dmy,x)  #x

int main() {
 #ifdef __STDC_LIB_EXT1__
    printf("c11/__STDC_LIB_EXT1__.c, %s\n", M_TO_S(__STDC_LIB_EXT1__));
 #else
    printf("c11/__STDC_LIB_EXT1__.c , no support\n");
 #endif
    return 0;
}
