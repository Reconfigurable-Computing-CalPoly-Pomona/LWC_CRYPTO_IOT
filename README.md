# LWC_CRYPTO_IOT
The emergence of the Internet of Things (IoT) applications presents a wide range of opportunities in areas such as automotive, consumer, energy, smart city, and many others. Since many of these systems operate in environments with heightened sensitivity and privacy, they require a trusted level of security. In addition, the implemented security measures must fit within strict power and area budgets, yet deliver maximum performance mandated by the application. Sponge construction-based hash functions are a good candidate for low-power, high-performance applications. It demands less accessibility to memory and depends on shuffling computed data on the register level. In this presentation,  we present the overview of our reconfigurable lightweight cryptographic architecture. RECO-ASCON is a reconfiguarable ASCON engine that can perform Both Hash and Hasha hashing algorithms. A reconfigurable engine that ideally detects a collision or pre-image attack, and change the algorithm to add increased difficulty for the attacker. 

dependancies
sbt/scala
chisel
verilator 
gtkwave 

## How to run 
cd LWC_CRYPTO_IOT

to run a test bench file 
./run.sh t "file Name"

to generate file 
./run.sh v "file Name"


to generate verilator file output
./run.sh s "file Name"

to view outputs on a waveform
cd test_run_dir
cd "generated file from 's' output"
gtkwave "file name".vcd
