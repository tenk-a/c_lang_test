int main() {
    const char *sdate = __DATE__;
    const char *stime = __TIME__;
    return !(sdate[0] != 0 && stime[0] != 0);
}
