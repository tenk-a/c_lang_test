#include "_intrin.h"    /* #include <intrin.h> */

int main() {
    return !(  _byteswap_ushort(0x3412)==0x1234
            && _byteswap_ulong(0x78563412)==0x12345678
            && _byteswap_uint64(0xf0debc9a78563412ll) == 0x123456789abcdef0ll );
}
