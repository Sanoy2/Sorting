#!/bin/bash

cd cpp/
./publish.sh
wait
cd ..

cd python/
./publish.sh
wait
cd ..

cd dotnet/
./publish.sh
wait
cd ..

echo Done
