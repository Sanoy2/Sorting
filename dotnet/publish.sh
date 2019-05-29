#!/bin/bash

sudo dotnet restore
wait

sudo dotnet publish -o ~/Thesis/Testing/Sorting/dotnet -r linux-x64 -f netcoreapp2.1 --self-contained -c Release
wait

sudo chmod +x ~/Thesis/Testing/Sorting/dotnet/dotnet
wait

echo Done
