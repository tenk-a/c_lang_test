#define MACRO_A     \
        100
#if \
    MACRO_A \
    == 100
int rc = 0;
#else
int rc = 1;
#endif

int main() {
    return rc;
}
