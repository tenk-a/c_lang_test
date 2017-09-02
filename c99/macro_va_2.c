#define MACRO_VA(a, ...)        a(__VA_ARGS__)
#define ADD3(x,y,z)             ((x)+(y)+(z))

int main() {
    return MACRO_VA(ADD3, 100, -128, 28);
}
