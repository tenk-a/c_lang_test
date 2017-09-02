int main() {
    const char *fname = __FILE__;
    int         line  = __LINE__;
    const char *sdate = __DATE__;
    const char *stime = __TIME__;
    return !(fname[0] != 0 && line == 3 && sdate[0] != 0 && stime[0] != 0);
}
