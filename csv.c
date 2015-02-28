# include <stdlib.h>
# include <stdio.h>
# include <string.h>

int main (int argC, char* argV[])
{
	char *host;
	int len = 6;
	int i = 0;
	host = argV[1];
	for (i = 0; i<len; i++)
	{
		printf("%c", host[i]);
	}
	printf("\n");
	return 1;
}