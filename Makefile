
all: cc cpy
.PHONEY: cc cpy clean

################################################################################
#
# C env checking.
#
GCC := gcc
GCCFLAGS := -Wall -g

cc: cmain
	./cmain

cmain: main.o
		$(GCC) $< -o $@ -lpthread

%.o: %.c
		$(GCC) $(GCCFLAGS) -c $< -o $@

################################################################################
#
# PY env checking.
#
cpy:
		@python --version >/dev/null 2>&1 || (echo "ERROR: python is required."; exit 1)
		@echo " * python ok"


################################################################################
#
# Cleanup.
#
clean:
		rm -f main.o cmain
