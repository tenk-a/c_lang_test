char const volatile str[] = "hello";
int const volatile  val   = 1;

int main() {
    int const volatile a = 0;
    return a * val;
}
