#include "_intrin.h"    /* #include <intrin.h> */

int main() {
    unsigned long       r = 0;
    if (_BitScanForward(&r, 0x40000000) == 0 || r != 30) return 1;
    if (_BitScanForward(&r, 0x00000004) == 0 || r !=  2) return 1;
    if (_BitScanReverse(&r, 0x40000000) == 0 || r != 30) return 1;
    if (_BitScanReverse(&r, 0x00000004) == 0 || r !=  2) return 1;
    return 0;
}
