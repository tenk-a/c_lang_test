int main() {
    int a;
    a  = 8;
    {
        static int b;
        b  = a * 2;
        a += b;
    }
    return ( !(a == 24) );
}
