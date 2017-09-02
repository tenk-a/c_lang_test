struct XY { short x, y; } func(int x, int y) {
    struct XY xy;
    xy.x = x;
    xy.y = y;
    return xy;
}

int main() {
    struct XY xy;
    xy = func(3, -3);
    return xy.x + xy.y;
}
