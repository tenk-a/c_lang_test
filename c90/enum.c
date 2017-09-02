enum {
    A,
    B,
    C=0,
    D
};

int main() {
    return A + B + C - D;
}
