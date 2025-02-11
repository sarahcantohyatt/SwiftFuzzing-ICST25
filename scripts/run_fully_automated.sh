#!/bin/sh
cd ..
mkdir testprograms
mkdir triggers
cd scripts

echo "filename,# of annotated exps,# of mutants lvl 1,# of programs tested if timeout lvl 1,# of mutants lvl 2,# of programs tested if timeout lvl2,# of mutants lvl 3,# of programs tested if timeout lvl3" > results.csv
./start.sh
./fully_automated.sh
for i in ../seedset/*.swift; do
	./next.sh
	./fully_automated.sh
done