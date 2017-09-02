#define MACRO_VA(a, ...)        a(__VA_ARGS__)

int add3(int x, int y, int z) {
    return x + y + z;
}

int main() {
    return MACRO_VA(add3, 100, -128, 28);
}
