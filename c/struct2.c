typedef struct {
    int x;
    int y;
} ST;

typedef struct {
    char    name[16];
    short   x;
    short   y;
} ST2;

ST  st1 = { 1, -1 };
ST2 st2 = {"dummy", 10, -10};

int main() {
    return  st1.x + st1.y + st2.x + st2.y ;
}
