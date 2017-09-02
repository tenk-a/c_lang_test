long long a = 0xFeFeFeFeFeFeFeFeLL;

int main() {
    switch (a) {
    case 0LL: return 1;
    case 0xFeFeFeFeFeFeFeFeLL: return 0;
    default: return -1;
    }
}
