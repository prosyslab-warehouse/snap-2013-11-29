#############################
# Makefile for ZOE library  #
#############################

LIB = -lm

OBJECTS = \
	zoeAlignment.o\
	zoeCDS.o\
	zoeCounter.o\
	zoeDNA.o\
	zoeDistribution.o\
	zoeDuration.o\
	zoeFastaFile.o\
	zoeFeature.o\
	zoeFeatureFactory.o\
	zoeFeatureTable.o\
	zoeHMM.o\
	zoeIsochore.o\
	zoeMath.o\
	zoeModel.o\
	zoePhasePref.o\
	zoeProtein.o\
	zoeScanner.o\
	zoeState.o\
	zoeTools.o\
	zoeTransition.o\
	zoeTrellis.o\


APP = zoe-loop
SRC = zoe-loop.c
OBJ = zoe-loop.o

APP2 = lexica
SRC2 = lexica.c
OBJ2 = lexica.o

APP3 = seqedit
SRC3 = seqedit.c
OBJ3 = seqedit.o

APP4 = seqstats
SRC4 = seqstats.c
OBJ4 = seqstats.o

APP5 = twinkle
SRC5 = twinkle.c
OBJ5 = twinkle.o

DATE = $(shell date +\%Y-\%m-\%d)

###########
# Targets #
###########

default:
	make gcc CFLAGS="$(CFLAGS)"

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

depend: $(OBJECTS:.o=.c)
	$(CC) -MM $^ > $@

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
	make $(APP) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"

all:
	make $(APP)  CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP2) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP3) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP4) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"
	make $(APP5) CFLAGS="-O2 -Wall -Werror $(CFLAGS)"


###################
# Inference Rules #
###################

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

################
# Dependancies #
################

include depend

