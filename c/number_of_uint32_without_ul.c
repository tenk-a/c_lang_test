int main() {
    unsigned long l = 0x12345678;
    l += 0x10101010;
    return !(l == 0x22446688);
}
