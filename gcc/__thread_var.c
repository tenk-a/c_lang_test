__thread int tls_var;

int main() {
    tls_var = 0;
    return tls_var;
}
