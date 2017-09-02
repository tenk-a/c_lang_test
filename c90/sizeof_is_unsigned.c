int main() {
    unsigned n;
    /* It expects to be sizeof(size_t)==sizeof(uintptr_t)==sizeof(char*) */
    n = sizeof(char*) * 8 - 1;
    return !((sizeof(char) << n) > 0);
}
