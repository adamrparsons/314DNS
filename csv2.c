# include <stdlib.h>
# include <stdio.h>
# include <string.h>

int main (int argC, char* argV[])
{
	char *host;
	int i = 0;
	host = argV[1];
	for (i = 7; i<25; i++)
	{
		printf("%c", host[i]);
	}
	printf("\n");
	return 1;
}