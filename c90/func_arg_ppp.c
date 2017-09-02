int func(int buf[], ...) {
    return buf[0];
}

int main() {
    int buf[3];
    buf[0] = 0;
    buf[1] = 1;
    buf[2] = 2;
    return func(buf, buf[0],buf[1], buf[2]);
}
