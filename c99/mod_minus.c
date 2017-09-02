int ck(int a, int b, int modR) {
    int d = a / b, r = a % b;
    return (r == modR) && ((d * b + r) == a);
}

int main() {
    return !( ck(-1,2,-1) && ck(1,-2,1) && ck(-999,4,-3) && ck(999,4,3) );
}
