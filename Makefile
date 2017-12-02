#
# GNU Makefile for RS232
#

#..............................................................................
# Tools

CC = gcc
CFLAGS = -Wall -Wextra -Wshadow -Wformat-nonliteral -Wformat-security \
		 -Wtype-limits -o2

RM = rm -rf
MKDIR = mkdir -p

#..............................................................................
# Phony rules

.PHONY: all
all: bin/test_cmd bin/test_rx bin/test_tx

.PHONY: clear
clean:
	$(RM) bin
	$(RM) obj

.PHONY: run
run:
	bin/test_cmd

#..............................................................................
# Executables
bin/test_cmd: obj/rs232.o obj/demo_cmd.o | bin/
	$(CC) obj/rs232.o obj/demo_cmd.o -o bin/test_cmd

bin/test_rx: obj/rs232.o obj/demo_rx.o | bin/
	$(CC) obj/rs232.o obj/demo_rx.o -o bin/test_rx

bin/test_tx: obj/rs232.o obj/demo_tx.o | bin/
	$(CC) obj/rs232.o obj/demo_tx.o -o bin/test_tx

#..............................................................................
# Object files
obj/demo_cmd.o: src/demo_cmd.c src/rs232.h | obj/
	$(CC) $(CFLAGS) -c src/demo_cmd.c -o obj/demo_cmd.o

obj/demo_rx.o: src/demo_rx.c src/rs232.h | obj/
	$(CC) $(CFLAGS) -c src/demo_rx.c -o obj/demo_rx.o

obj/demo_tx.o: src/demo_tx.c src/rs232.h | obj/
	$(CC) $(CFLAGS) -c src/demo_tx.c -o obj/demo_tx.o

obj/rs232.o: src/rs232.h src/rs232.c | obj/
	$(CC) $(CFLAGS) -c src/rs232.c -o obj/rs232.o

#..............................................................................
# Folder creation
bin/:
	$(MKDIR) $@

obj/:
	$(MKDIR) $@

