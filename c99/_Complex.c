float  _Complex fc;
double _Complex dc;
long double _Complex ldc;
int main() {
    double d = 0.0;
    //dc  = 1.0 + 2.0i;
    dc  = d;
    d   = (double)dc;
    ldc = dc;
    return (int)(fc + dc + ldc);
}
