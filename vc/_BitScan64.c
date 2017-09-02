#include "_intrin.h"    /* #include <intrin.h> */

int main() {
    unsigned long       r = 0;
    if (_BitScanForward64(&r, 0x4000000000000000) == 0 || r != 62) return 1;
    if (_BitScanForward64(&r, 0x0000000000000004) == 0 || r !=  2) return 1;
    if (_BitScanReverse64(&r, 0x4000000000000000) == 0 || r != 62) return 1;
    if (_BitScanReverse64(&r, 0x0000000000000004) == 0 || r !=  2) return 1;
    return 0;
}
