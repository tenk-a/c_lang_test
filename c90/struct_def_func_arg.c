void func(int x, int y, struct XY { int x, y; }* xy) {
    xy->x = x;
    xy->y = y;
}

int main() {
    struct XY { int x, y; } xy;
    func(3, -3, &xy);
    return xy.x + xy.y;
}
