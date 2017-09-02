int func(int x, int y) {
    return x + y;
}

int (*g_funcp)(int,int) = func;

int main() {
    return g_funcp(12,-12);
}
