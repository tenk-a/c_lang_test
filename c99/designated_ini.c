struct {
    int     x;
    int     y;
    int     z;
    int     w;
} st = {
    .y = 100,
    .z = -5
};

int main() {
    return st.x + st.y + st.z + st.w - 95;
}
