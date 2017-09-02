int main() {
    return !( __builtin_popcount(0xCCCCCCCC) == 16
           && __builtin_clz(0x00000003) == 30
           && __builtin_ctz(0x40000000) == 30 );
}

