struct ST {
    int x, y;
};

int main() {
    struct ST st = { 7, -7 };
    return st.x + st.y;
}
