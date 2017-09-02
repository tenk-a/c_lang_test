int main() {
    return !( __builtin_popcountll(0xCCCCCCCCCCCCCCCCll) == 32
           && __builtin_clzll(0x0000000000000003ll) == 62
           && __builtin_ctzll(0x4000000000000000ll) == 62 );
}
