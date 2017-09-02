union UNI1 {
    double  dbl;
    char*   p[2];
};

union UNI2 {
    char*   p[2];
    double  dbl;
};

int main() {
    union UNI1 uni1 = { 0.0 };
    union UNI2 uni2 = { 0, 0 };
    return uni2.p[1] - uni2.p[0];
}
