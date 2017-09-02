#define MAC_TO_STR(x)   #x

int main() {
    char* s;
    s = MAC_TO_STR(Abcdefg);
    return !(s[3] == 'd');
}
