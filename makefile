decode: decode.o libcypher.so bypass-key.o fix-change.o
	gcc -m32 bypass-key.o decode.o fix-change.o -L. -Wl,-rpath='$$ORIGIN' -lcypher -o decode

bypass-key.o: bypass-key.c
	gcc -m32 -c $< -o $@

fix-change.o: fix-change.S
	as -32 $< -o $@

.PHONY: clean dist

clean:
	rm -f decode bypass-key.o fix-change.o

dist:
	tar zcvf decode.tar.gz makefile fix-change.S bypass-key.c decode.o libcypher.so