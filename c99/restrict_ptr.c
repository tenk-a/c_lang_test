void func(char * restrict dst, char const * restrict src, unsigned n) {
    unsigned i;
    for (i = 0; i < n; ++i)
        dst[i] = src[i];
}

int main() {
    char    buf[32];
    func(buf, "hello", 6);
    return !(buf[3] == 'l');
}
