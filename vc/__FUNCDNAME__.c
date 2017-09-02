int main() {
    const char* s = __FUNCDNAME__;
    return !(s && s[0] != '\0');
}
