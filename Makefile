C = gcc

OBJS= /home/sv-linux/src/output/m1.o \
	  /home/sv-linux/src/output/m2.o

INC= -I/home/sv-linux/src/m2/include/ \
	 -I/home/sv-linux/src/m1/include/ \
	 -I/home/sv-linux/src/include/

OUT= /home/sv-linux/src/output

PREFIX= /usr/local/bin
TARGET= app

.PHONY: all clean install install-strip uninstall

all: $(TARGET)

$(TARGET): m1.o m2.o
	$(C) $(OBJS) -o $(OUT)/$(TARGET).out

$(OUT)/m1.s: /home/sv-linux/src/m1/m1.c
	$(C) $(INC) -S $(OUT) $^
	mv m1.s $(OUT)/

m1.o: $(OUT)/m1.s
	$(C) $(INC) -c -o $(OUT)/m1.o $^

$(OUT)/m2.s: /home/sv-linux/src/m2/m2.c
	$(C) $(INC) -S $^
	mv m2.s $(OUT)/

m2.o: $(OUT)/m2.s
	$(C) $(INC) -c -o $(OUT)/m2.o $^

$(OBJS): $(INC)

install:
	install $(OUT)/$(TARGET) $(PREFIX)

install-strip:
	install -s $(OUT)/$(TARGET) $(PREFIX)

uninstall:
	rm -f $(PREFIX)/$(TARGET) 

clean:
	rm -rf $(OUT)/*.s 	$(TARGET)
	rm -rf $(OUT)/*.o 	$(TARGET)
	rm -rf $(OUT)/*.out $(TARGET)