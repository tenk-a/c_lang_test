#if defined(__BORLANDC__) || defined(_MSC_VER) || defined(__DMC__) || defined(__WATCOMC__) || defined(__ORANGEC__)
typedef unsigned __int64    ULONGLONG;
#else
typedef unsigned long long  ULONGLONG;
#endif

int main() {
    ULONGLONG ll = 0x0123456789abcdef;
    ll  +=         0x1010101010101010;
    return !((ll>>32) ==0x11335577 && (ll & 0xffffffff) == 0x99bbddff);
}
