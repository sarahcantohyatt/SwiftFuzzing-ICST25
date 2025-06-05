This repo is an artifact for the paper Mutation-Based Fuzzing of the Swift Compiler with Incomplete Type Information published in ICST 2025. </br>
Link to [paper](https://ieeexplore.ieee.org/document/10989032) </br>

The jar file is provided so the scripts should run as intended. </br>
If for some reason you need to build the jar file, see the system configuration requirments at the bottom of this readMe.

### Instructions to re-create experiments from paper
Navigate to the /scripts directory. </br>
Execute `./run_fully_automated.sh` </br>
This will take each program in the /seedset directory and run it on each level of the fuzzer as described in the paper. </br>
Mutants that failed to compile will appear in the /triggers directory. Each failing batch of mutants along with their output will appear under a directory named respectively to its original seed file, and within that directory they are further grouped by level of fuzzer. </br>
This additionally produces a .csv file located in the /scripts directory containing information that we used for our calculations.

### Build instructions
In order to run as intended, Scala, sbt, and Swift need to be installed. </br>
My configuration: </br>
`Scala code runner version 2.13.12 -- Copyright 2002-2023, LAMP/EPFL and Lightbend, Inc.` </br>
`sbt version in this project: 1.8.2` </br>
`swift-driver version: 1.75.2 Apple Swift version 5.8.1 (swiftlang-5.8.0.124.5 clang-1403.0.22.11.100)` </br>
and/or </br>
`swift-driver version: 1.90.11.1 Apple Swift version 5.10 (swiftlang-5.10.0.13 clang-1500.3.9.4)` </br>
From the top level of the directory run `sbt assembly` to create the .jar file. </br>
