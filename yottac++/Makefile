# 20210413

cpp=g++
ydb=$(shell pkg-config --variable=prefix yottadb)
coptions=-I$(ydb) -I../src/ -I/usr/local/Crow/include -Wall -pthread
loptions=-L$(ydb) -lyottadb
baseexecutables=test1 test2 test3 test4 test5-query \
        cpp-api-wordfreq \
        object-db-blob object-db-globalmapping lock

executables=$(patsubst %,bin/%,$(baseexecutables))

all:   $(executables)

ydb-global.o: ../src/ydb-global.cpp ../src/ydb-global.h
	$(cpp) -c ../src/ydb-global.cpp $(coptions)

bin/%: %.cpp ydb-global.o
	$(cpp) $< ydb-global.o $(coptions) $(loptions) -o $@
clean:
	rm -f *.o

clean-all: clean
	rm -f $(executables)


