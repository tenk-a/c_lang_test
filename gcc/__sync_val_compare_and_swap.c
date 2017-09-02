int g_val=0;

int main() {
    if (__sync_val_compare_and_swap(&g_val, 0, 1) != 0)
        return 1;
    return g_val - 1;
}
