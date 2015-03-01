CC = gcc
CFLAGS = -Wall -Wextra -ansi -pedantic -g

csv:
	$(CC) $(CFLAGS) csv.c -o csv

clean:
      	rm -f $(EXEC) $(OBJ)


