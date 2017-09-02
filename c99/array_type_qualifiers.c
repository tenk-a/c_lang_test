void func1(char a[const]) {}
void func2(char a[volatile]) {}
void func3(char a[static 1000]) {}
#ifndef __cplusplus
void func4(char a[restrict], char b[restrict]) {}
#endif

int main() {
    char    buf[1024], buf2[1024];
    func1(buf);
    func2(buf);
    func3(buf);
  #ifndef __cplusplus
    func4(buf, buf2);
  #endif
    return 0;
}
