int func(int n) {
    typedef int buf_t[n];
    int         l = sizeof(buf_t);
    n += 10;
    buf_t       buf;
    return sizeof(buf) == l;
}

int main() {
    return !func(100);
}
