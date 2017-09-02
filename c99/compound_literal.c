typedef struct ST {
    int x, y;
} ST;

int main() {
    ST st = (ST){ 108, 108 };
    ST st2;
    st2   = (ST){ 100, -100 };
    return st.x * st2.x + st.y * st2.y;
}
