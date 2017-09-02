#define M_1(x)      M_2(x,1)
#define M_2(x,y)    #x
#define X

int main() {
    return !(M_1(X)[0] == 0);
}
