__forceinline int ifunc(int x, int y, int z) {
    return x + y + z;
}

int main() {
    return ifunc(1000, -1024, 24);
}
