CC = gcc
CFLAGS = -Wall -g

TARGET = bin/bc

SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c,obj/%.o,$(SRC))

all: $(TARGET)

$(TARGET): $(OBJ) | bin
	$(CC) -o $@ $^

obj/%.o: src/%.c | obj
	$(CC) $(CFLAGS) -c $< -o $@

bin:
	mkdir -p bin

obj:
	mkdir -p obj

clean:
	rm -rf obj

mrproper: clean
	rm -rf bin

obj/main.o: src/annexe.h

.PHONY: all clean mrproper