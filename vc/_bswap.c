int main() {
    return !(  _bswap(0x78563412)==0x12345678
            && _bswap64(0xf0debc9a78563412ll) == 0x123456789abcdef0ll );
}
