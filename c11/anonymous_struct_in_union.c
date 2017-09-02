union UNI {
    int         typ;
    void*       ptr;
    struct {
        unsigned short  x, y;
    };
};

int main() {
    union UNI uni;
    uni.typ = 0;
    uni.ptr = 0;
    uni.x   = uni.y = 0;
    return 0;
}
