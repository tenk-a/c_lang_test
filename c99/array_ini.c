int a[5] = {
    [1] = 10,
    [3] = 255,
};

int main() {
    return !(a[0] == 0 && a[1] == 10 && a[2] == 0 && a[3] == 255 && a[4] == 0);
}