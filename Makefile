CA65=ca65
LD65=ld65

ODIR=obj

_OBJ = bank_00.o \
	bank_01.o \
	bank_02.o \
	bank_03.o \
	bank_04.o \
	bank_05.o \
	bank_06.o \
	bank_07.o \
	bank_08.o \
	bank_09.o \
	bank_0A.o \
	bank_0B.o \
	bank_0C.o \
	bank_0D.o \
	bank_0E.o \
	bank_0F.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.asm
	$(CA65) -g -o $@ $<

FinalFantasy.nes: $(OBJ)
	$(LD65) -C nes.cfg $(OBJ) -m mapfile.txt -Ln labels.txt -o FinalFantasy.nes --dbgfile FinalFantasy.dbg

.PHONY: clean

clean:
	rm $(ODIR)/*