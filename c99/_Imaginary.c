float  _Imaginary fi;
double _Imaginary di;
long double _Imaginary ldi;
int main() {
    double _Complex dc = 0.0;
    di  = (double _Imaginary)dc;
    ldi = di;
    return (int)(fi + dc + ldi);
}
