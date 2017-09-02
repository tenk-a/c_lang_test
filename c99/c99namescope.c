enum {A, B};
int main() {
    int rc = 1;
    if (rc)
        rc = sizeof(enum{B, A});
    return A;
}
