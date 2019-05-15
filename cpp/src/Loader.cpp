#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include "Loader.h"

std::vector<int> Loader::Load(std::string path)
{
    std::vector<int> vector;
    std::ifstream file;

    file.open(path);

    if(!file)
    {
        std::cerr << "Error while opening the file " << path << std::endl;
        return std::vector<int>();
    }
    
    int number;
    while(file >> number)
    {
        vector.push_back(number);
    }
    file.close();
    // std::cout << "Vector length: " << vector.size() << std::endl;

    return vector;
}