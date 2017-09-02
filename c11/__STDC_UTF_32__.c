/*#include <uchar.h>*/
#if defined(__cplusplus)
#include <stdio.h>
#endif
#define M_TO_S(x)       M_TO_S2(0,x)
#define M_TO_S2(dmy,x)  #x

int main() {
 #ifdef __STDC_UTF_32__
    printf("c11/__STDC_UTF_32__.c, %s\n", M_TO_S(__STDC_UTF_32__));
 #else
    printf("c11/__STDC_UTF_32__.c , no support\n");
 #endif
    return 0;
}
