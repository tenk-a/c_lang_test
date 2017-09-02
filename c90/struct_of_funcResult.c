typedef struct ST {
    int x, y;
} ST;

ST func(int x, int y) {
    ST st;
    st.x = x;
    st.y = y;
    return st;
}

int main() {
    ST st;
    st = func(13,-13);
    return st.x + st.y;
}
