char* mem_p_cpy(d,s,n)
    char* d;
    char* s;
{
    char* e;
    e = d + n;
    while (d < e)
        *d++ = *s++;
    return d;
}

main() {
    char    buf[99];
    char*   p;
    p = mem_p_cpy(buf, "hello", 6);
    exit( !(p == buf+6) );
}
