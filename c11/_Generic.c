float Negf(float x) { return -x; }
double Neg(double x) { return -x; }
long double Negl(long double x) { return -x; }
#define Neg(X)      _Generic((X), long double: Negf, default: Neg, float: Negf)(X)

int main() {
    float f = Neg(1.f);
    double d = Neg(1.0);
    long double ld = Neg(1.L);
    return 0;
}
