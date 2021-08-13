decode: decode.o libcypher.so bypass-key.o
	gcc -m32 bypass-key.o decode.o -L. -Wl,-rpath='$$ORIGIN' -lcypher -o decode

bypass-key.o: bypass-key.c
	gcc -m32 -c $< -o $@


.PHONY: clean

clean:
	rm -f decode