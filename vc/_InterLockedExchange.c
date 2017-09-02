#include "_intrin.h"    /* #include <intrin.h> */
long g_val=0;

int main() {
    if (_InterlockedExchange(&g_val, 1) != 0)
        return 1;
    return g_val - 1;
}
