void func(char m[*][*], int w, int h);

void func(m, w, h)
    int w, h;
    char m[h][w];
{
    int x,y;
    for (y = 0; y < h; ++y) {
        for (x = 0; x < w; ++x)
            m[h-1-y][w-1-x] = y * w + x;
    }
}

int main() {
    char    m[25][80];
    func(m, 80, 25);
    return m[24][79];
}
