int foo() {
    extern char* baz;
    return 0;
}

int main() {
    char* p;
    p = baz;
    foo();
    return p != 0;
}
