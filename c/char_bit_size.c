int main() {
    int i;
    char c;
    c = 0x01;
    for (i = 0; c && i < 32; ++i) {
        c <<= 1;
    }
    return i;
}
