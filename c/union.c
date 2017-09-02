union U {
    int     i;
    char*   p;
};

int main() {
    return !(sizeof(union U) == sizeof(char*));
}
