typedef struct ST {
    int x;
    int y;
} ST;

int func(ST st) {
    return st.x + st.y;
}

int main() {
    ST st0 = { 11, -11 };
    return func(st0);
}
