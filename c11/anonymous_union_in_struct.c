struct ST {
    int         tag;
    union {
        double  dbl;
        char    name[8];
    };
};

int main() {
    struct ST st;
    st.tag = 0;
    st.name[0] = 0;
    st.dbl = 0.0;
    return 0;
}
