/* http://d.hatena.ne.jp/yupo5656/20070204/p1 */
#if  (defined(_MSC_VER) && _MSC_VER < 1300) || (defined(__BORLANDC__) && __BORLANDC__ < 0x570) || defined(__ORANGEC__)
typedef unsigned __int64    ULONGLONG;
#elif defined(LSI_C)
typedef unsigned long       ULONGLONG;
#else
typedef unsigned long long  ULONGLONG;
#endif

ULONGLONG fn(int n) {
    return n / 4294967295;
}

int main() {
    return (int)fn(-1);
}
