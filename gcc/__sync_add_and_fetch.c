int     g_count = 0;

int main() {
    __sync_add_and_fetch(&g_count, 1);
    __sync_sub_and_fetch(&g_count, 1);
    return g_count;
}
