#include "_intrin.h"    /* #include <intrin.h> */
long    g_count = 0;

int main() {
    _InterlockedIncrement(&g_count);
    _InterlockedDecrement(&g_count);
    return g_count;
}
