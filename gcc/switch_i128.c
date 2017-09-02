unsigned __int128 a = 0x123456789ABCDEF0123456789ABCDEF0;

int main() {
    switch (a) {
    case 0: return 1;
    case 0x123456789ABCDEF0123456789ABCDEF0: return 0;
    default: return -1;
    }
}
