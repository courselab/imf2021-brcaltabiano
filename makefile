decode: fix-change.o libcrack.so libcypher.so
	gcc -m32 decode.o -L. -Wl,-rpath='$$ORIGIN' -lcrack -lcypher -o decode

bypass-key.o: bypass-key.c
	gcc -m32 -c $< -o $@

fix-change.o: fix-change.S
	as -32 $< -o $@

libcrack.so: bypass-key.o fix-change.o
	gcc -m32 --shared $^ -o $@

.PHONY: clean dist

clean:
	rm -f decode bypass-key.o fix-change.o libcrack.so

DISTNAME=decode-fixed

dist :
	make clean
	rm -rf $(DISTNAME) ; mkdir $(DISTNAME)
	cp *.o *.so *.c *.S makefile $(DISTNAME)
	tar zcvf $(DISTNAME).tar.gz $(DISTNAME)
