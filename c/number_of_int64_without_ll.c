#if defined(__BORLANDC__) || defined(_MSC_VER) || defined(__DMC__) || defined(__WATCOMC__) || defined(__ORANGEC__)
typedef __int64     LONGLONG;
#else
typedef long long   LONGLONG;
#endif

int main() {
    LONGLONG ll = 12345678901234567890;
    ll += 3;
    return !(ll == 12345678901234567893);
}
