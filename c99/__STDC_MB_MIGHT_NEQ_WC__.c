#include <wchar.h>
#if defined(__cplusplus)
#include <stdio.h>
#endif
#define M_TO_S(x)       M_TO_S2(0,x)
#define M_TO_S2(dmy,x)  #x

int main() {
 #ifdef __STDC_MB_MIGHT_NEQ_WC__
    printf("c99/__STDC_MB_MIGHT_NEQ_WC__.c, %s\n", M_TO_S(__STDC_MB_MIGHT_NEQ_WC__));
 #else
    printf("c99/__STDC_MB_MIGHT_NEQ_WC__.c , no support\n");
 #endif
    return 0;
}

