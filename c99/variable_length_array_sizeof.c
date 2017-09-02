int func(int n) {
    int buf[n];
    return sizeof(buf) == sizeof(int) * n;
}

int main() {
    return !func(1000);
}
