typedef struct ST {
    int x, y;
} ST;

ST add(ST const a, ST const* b) {
    ST r = a;
    r.x += b->x;
    r.y += b->y;
    return r;
}

int main() {
    ST st = (ST){ 108, -108 };
    st = add(st, &(ST){-100, 100});
    return st.x + st.y;
}
