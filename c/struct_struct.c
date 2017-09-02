struct A {
    int a;
    struct B {
        int b;
    } st_b;
};

struct B g_b;

int main() {
    return g_b.b;
}
