#if defined(_WIN64) || defined(CPU64) || defined(__amd64__)
typedef unsigned long long  UINTE;
#else
typedef unsigned UINTE;
#endif

__attribute__((aligned(16))) char a[64];

int main() {
    return ((UINTE)a) & 0x0f;
}
