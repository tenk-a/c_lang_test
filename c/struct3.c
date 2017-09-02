typedef struct { int x, y; } ST;
struct ST { short a, b; };

ST        st1 = { 1, -1 };
struct ST st2 = { -10, 10};

int main() {
    return  st1.x + st1.y + st2.a + st2.b ;
}
