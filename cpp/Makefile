CXX = g++
CXXFLAGS = -Wall -Werror -Wextra -pedantic -std=c++17 -g 
LDFLAGS =

SRC = *.cpp
OBJ = $(SRC:.cc=.o)
EXEC = a.out

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CXX) $(LDFLAGS) -o $@ $(OBJ) $(LBLIBS) -O2

clean:
	rm -rf $(OBJ) $(EXEC)