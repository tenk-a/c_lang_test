struct ST {
    unsigned    a : 1;
    unsigned    b : 7;
} st = { 0, 63 };

int main() {
    struct ST   st2;
    st2.a = 1;
    st2.b = 127;
    return st.a * st.b * st2.a * st2.b;
}
