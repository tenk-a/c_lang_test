#define ADD3(x,y,z)             ((x)+(y)+(z))
#define MACRO_A(a,x,y,z)        a(x,y,z)

int main() {
    int i;
    i  = ADD3(10, -11, 2);
    i += MACRO_A(ADD3, 100, -128, 27);
    return i;
}
