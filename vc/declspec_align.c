#if defined(_WIN64) || defined(CPU64)
typedef unsigned long long  UINTE;
#else
typedef unsigned UINTE;
#endif

__declspec(align(16)) char a[64];

int main() {
    return ((UINTE)a) & 0x0f;
}
