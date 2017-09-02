#include "_intrin.h"    /* #include <intrin.h> */
volatile int g_var = 0;

int main() {
    int c;
    c = g_var;
    _ReadWriteBarrier();
    g_var = 1;
    _WriteBarrier();
    c = g_var;
    _ReadBarrier();
    return c - 1;
}
