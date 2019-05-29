#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <sstream>

#include "Loader.h"

int main(int argc, char** argv)
{
    bool sortOn = true;
    
    int numberOfInts = strtol(argv[1], NULL, 10);
    int numberOfFiles = strtol(argv[2], NULL, 10);
    std::string directoryWithFiles = std::string(argv[3]);
    std::string sortOnString = std::string(argv[4]);

    if(sortOnString == "true")
        sortOn = true;
    else if(sortOnString == "false")
        sortOn = false;
    else
    {
        std::cout << "Invalid sortOn argument" << std::endl;
        return 1;
    }
        
    std::cout << "Number of ints: " << numberOfInts << std::endl;
    std::cout << "Number of files: " << numberOfFiles << std::endl;
    std::cout << "Main path: " << directoryWithFiles << std::endl;
    std::cout << "Sorting on?: " << sortOn << std::endl;
    
    Loader loader;
    std::string path;
    std::vector<int> vector;
    std::stringstream pathStream;

    for(int i = 0; i < numberOfFiles; i++)
    {
        pathStream.str("");
        pathStream << directoryWithFiles << numberOfInts << "/"<< i << ".txt";
        path = pathStream.str();
        vector = loader.Load(path);
        if(sortOn)
        {
            std::sort(vector.begin(), vector.end()); 
        }       
    }

    return 0;
}