void bar() {
}

void* foo() {
    bar();
    return 0;
}

int main() {
    void* p;
    char* q;
    p = foo();
    q = p;
    return !(q == p);
}
