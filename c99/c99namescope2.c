enum {A, B};

int main() {
    if (sizeof(enum{B, A}) == sizeof(long double))
        ;
    return A;
}
