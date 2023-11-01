# Define the compiler and compiler flags
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Werror

# Define the source and object files
SRC = writer.c
OBJ = writer.o

# Define the output binary name
OUTPUT = writer

# Default target: build the writer application
all: $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^
	@echo "Build successful."

# Clean target: remove application and object files
clean:
	rm -f $(OUTPUT) $(OBJ)
	@echo "Cleaned."

.PHONY: all clean
