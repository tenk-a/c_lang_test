int main() {
    char    buf[10];
    char*   r;
    r       = &buf;
    return !(r == buf);
}
