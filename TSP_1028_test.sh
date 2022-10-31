#!/bin/bash


# # repeat times
for ((times = 0; times < 10; times++))
do

    # LLMST
    ./RankingEDAsCEC -i ./TSP_instance/pr76.tsp\
                    -o ./TSP_result/LLMST75/pr76_3040_LLMST75_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m LLMST -d C -v 0\
                    -p 3040\
                    -e 5776000\
                    -b 0.1 -n 59 &

    # GMC
    ./RankingEDAsCEC -i ./TSP_instance/pr76.tsp\
                    -o ./TSP_result/GMC/pr76_10_GMC_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m GM -d C -v 0\
                    -p 10\
                    -e 5776000 &

    # NO
    ./RankingEDAsCEC -i ./TSP_instance/pr76.tsp\
                    -o ./TSP_result/NO/pr76_760_NO_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NO -d C -v 0\
                    -p 760\
                    -e 5776000\
                    -b 0.0002 &

    # ET
    ./RankingEDAsCEC -i ./TSP_instance/pr76.tsp\
                    -o ./TSP_result/ET5/pr76_76_ET5_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 76\
                    -e 5776000\
                    -b 0.01\
                    -c 5 &


done
# repeat times end