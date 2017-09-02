int main() {
    register int reg;
    int*    r = &reg;
    reg = 0;
    return *r;
}
