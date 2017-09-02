#define MACRO_0     0
#define MAC(n)      MACRO_##n

int main() {
    return MAC(0);
}
