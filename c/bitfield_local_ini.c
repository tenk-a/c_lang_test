struct ST {
    int     a : 1;
    int     b : 7;
};

int main() {
    struct ST st = { 0, 33 };
    return st.a * st.b;
}
