GCC = gcc
CFLAGS = -g
HEADERS = y.tab.h
FLEX_FILE = scan.l
C_FILES = test.c lex.yy.c
OBJECT_FILES = test.o lex.yy.o
EXECUTABLE = execute

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECT_FILES)
		$(GCC) $(OBJECT_FILES) -o $(EXECUTABLE)

lex.yy.c: $(FLEX_FILE) $(HEADERS)
		flex $(FLEX_FILE)

%.o: %.c $(HEADERS)
		$(GCC) -c $(CFLAGS) $*.c -o $*.o 

.PHONY: clean

clean:
		rm *.o lex.yy.c $(EXECUTABLE)
