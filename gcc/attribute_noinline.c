__attribute__((noinline)) int func() {
    return 0;
}

int main() {
    return func();
}
