union {
    double  dbl;
    char*   p[2];
} uni =  { 0.0 };

union {
    char*   p[2];
    double  dbl;
} uni2 = { 0, 0 };

int main() {
    return uni2.p[1] - uni2.p[0];
}
