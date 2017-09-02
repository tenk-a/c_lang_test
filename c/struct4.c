char a[1];
int main() {
    struct a { char ary[16]; };
    return sizeof(a) - 1;
}
