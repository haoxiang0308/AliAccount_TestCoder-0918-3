CC=gcc
CFLAGS=-Wall

hello: hello.c
	$(CC) $(CFLAGS) -o hello hello.c

clean:
	rm -f hello

