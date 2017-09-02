#define US      L"\u306F\u308D\U000030FC"
int main() {
    return !(US[0] == 0x306F && US[1] == 0x308D && US[2] == 0x30FC);
}
