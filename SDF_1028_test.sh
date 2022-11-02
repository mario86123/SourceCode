#!/bin/bash

# # repeat times
for ((times = 0; times < 10; times++))
do

    # LLMST
    ./RankingEDAsCEC -i ./SDF_instance/60.txt\
                    -o ./SDF_result/LLMST59/60_2400_LLMST59_"$times".txt\
                    -s "$times"\
                    -t SDF\
                    -m LLMST -d C -v 0\
                    -p 2400\
                    -e 3600000\
                    -b 0.1 -n 59 &

    # GMC
    ./RankingEDAsCEC -i ./SDF_instance/60.txt\
                    -o ./SDF_result/GMC/60_10_GMC_"$times".txt\
                    -s "$times"\
                    -t SDF\
                    -m GM -d C -v 0\
                    -p 10\
                    -e 3600000 &

    # NO
    ./RankingEDAsCEC -i ./SDF_instance/60.txt\
                    -o ./SDF_result/NO/60_1200_NO_"$times".txt\
                    -s "$times"\
                    -t SDF\
                    -m NO -d C -v 0\
                    -p 1200\
                    -e 3600000\
                    -b 0.0002 &

    # ET
    ./RankingEDAsCEC -i ./SDF_instance/60.txt\
                    -o ./SDF_result/ET5/60_10_ET5_"$times".txt\
                    -s "$times"\
                    -t SDF\
                    -m ET -d C -v 0\
                    -p 10\
                    -e 3600000\
                    -b 0.01\
                    -c 5 &


done
# repeat times end
wait