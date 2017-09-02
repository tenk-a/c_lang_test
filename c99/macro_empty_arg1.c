#define M_1(x)      M_2(x)
#define M_2(x)      #x
#define X

int main() {
    return !(M_1(X)[0] == 0);
}
