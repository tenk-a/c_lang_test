struct {
    unsigned    a : 1;
    unsigned    b : 7;
} st = { 0, 63 };

int main() {
    return st.a * st.b;
}
