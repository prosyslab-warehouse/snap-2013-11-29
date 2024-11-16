######################
# Makefile for SNAP  #
######################

export CFLAGS LDFLAGS

LIB = -lm
INC = -IZoe

OBJECTS = \
	Zoe/zoeAlignment.o\
	Zoe/zoeCDS.o\
	Zoe/zoeCounter.o\
	Zoe/zoeDNA.o\
	Zoe/zoeDistribution.o\
	Zoe/zoeDuration.o\
	Zoe/zoeFastaFile.o\
	Zoe/zoeFeature.o\
	Zoe/zoeFeatureFactory.o\
	Zoe/zoeFeatureTable.o\
	Zoe/zoeHMM.o\
	Zoe/zoeIsochore.o\
	Zoe/zoeMath.o\
	Zoe/zoeModel.o\
	Zoe/zoePhasePref.o\
	Zoe/zoeProtein.o\
	Zoe/zoeScanner.o\
	Zoe/zoeState.o\
	Zoe/zoeTools.o\
	Zoe/zoeTransition.o\
	Zoe/zoeTrellis.o\

APP = snap
SRC = snap.c
OBJ = snap.o

APP2 = fathom
SRC2 = fathom.c
OBJ2 = fathom.o

APP3 = forge
SRC3 = forge.c
OBJ3 = forge.o

APP4 = hmm-info
SRC4 = hmm-info.c
OBJ4 = hmm-info.o

APP5 = exonpairs
SRC5 = exonpairs.c
OBJ5 = exonpairs.o

DATE = $(shell date +\%Y-\%m-\%d)

###########
# Targets #
###########

default:
	make gcc

$(APP): $(OBJ) $(OBJECTS)
	$(CC) -o $(APP) $(CFLAGS) $(CPPFLAGS) $(OBJ) $(OBJECTS) $(LIB) $(LDFLAGS)

$(APP2): $(OBJ2) $(OBJECTS)
	$(CC) -o $(APP2) $(CFLAGS) $(CPPFLAGS) $(OBJ2) $(OBJECTS) $(LIB) $(LDFLAGS)

$(APP3): $(OBJ3) $(OBJECTS)
	$(CC) -o $(APP3) $(CFLAGS) $(CPPFLAGS) $(OBJ3) $(OBJECTS) $(LIB) $(LDFLAGS)

$(APP4): $(OBJ4) $(OBJECTS)
	$(CC) -o $(APP4) $(CFLAGS) $(CPPFLAGS) $(OBJ4) $(OBJECTS) $(LIB) $(LDFLAGS)

$(APP5): $(OBJ5) $(OBJECTS)
	$(CC) -o $(APP5) $(CFLAGS) $(CPPFLAGS) $(OBJ5) $(OBJECTS) $(LIB) $(LDFLAGS)

clean:
	rm -f *.o $(APP) $(APP2) $(APP3) $(APP4) $(APP5)
	cd Zoe; make clean

depend: $(OBJECTS:.o=.c)
	$(CC) $(INC) -MM $^ > $@

tar:
	rm -rf /tmp/$(APP)
	mkdir /tmp/$(APP)
	cp -r * /tmp/$(APP)
	cd /tmp/$(APP); make clean;  rm -rf CVS */CVS
	cd /tmp; tar -zcvf $(APP)-$(DATE).tar.gz $(APP)
	rm -rf /tmp/$(APP)


#################
# Architectures #
#################

gcc:
	cd Zoe; make CFLAGS="$(CFLAGS)";
	make $(APP) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP2) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP3) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP4) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP5) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"


###################
# Inference Rules #
###################

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INC) -c -o $@ $<

################
# Dependancies #
################

include depend

