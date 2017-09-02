int ck0_10(int n) {
    return n < 10U;
}

int main() {
    return !(ck0_10(-1) == 0);
}
