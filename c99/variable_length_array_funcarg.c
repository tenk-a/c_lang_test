void func(int w, int h, char m[h][w]) {
    int x,y;
    for (y = 0; y < h; ++y) {
        for (x = 0; x < w; ++x)
            m[h-1-y][w-1-x] = y * w + x;
    }
}

int main() {
    char    m[25][80];
    func(80, 25, m);
    return m[24][79];
}
