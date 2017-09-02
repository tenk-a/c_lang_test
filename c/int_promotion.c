#include <stdio.h>
int main() {
	unsigned	a = 1;
	unsigned	b = 2;
	int c  = (a - b == 4294967295);
	c	  |= (a - b == -1) << 1;
	if (c == 1)
		printf("c/int_promotion.c , long to unsigned long\n");
	else if (c == 2)
		printf("c/int_promotion.c , long to long long\n");
	else if (c == 3)
		printf("c/int_promotion.c , both\n");
	else
		printf("c/int_promotion.c , fail[e]\n");
	return 0;
}
