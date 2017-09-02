struct ST {
    int x, y;
} st = { 11, -11 };

int main() {
    struct ST st0 = st;
    struct ST st1;
    st1 = st0;
    return st1.x + st1.y;
}
