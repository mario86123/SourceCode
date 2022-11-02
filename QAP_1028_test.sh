#!/bin/bash

# # repeat times
for ((times = 0; times < 10; times++))
do
    # 100a
    # LLMST
    ./RankingEDAsCEC -i ./QAP_instance/tai100a.dat.dat\
                    -o ./QAP_result/LLMST99/100a_100_LLMST99_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m LLMST -d C -v 0\
                    -p 100\
                    -e 10000000\
                    -b 0.1 -n 99 &

    # GMC
    ./RankingEDAsCEC -i ./QAP_instance/tai100a.dat.dat\
                    -o ./QAP_result/GMC/100a_10_GMC_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m GM -d C -v 0\
                    -p 10\
                    -e 10000000 &

    # NO
    ./RankingEDAsCEC -i ./QAP_instance/tai100a.dat.dat\
                    -o ./QAP_result/NO/100a_300_NO_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NO -d C -v 0\
                    -p 300\
                    -e 10000000\
                    -b 0.0002 &

    # ET
    ./RankingEDAsCEC -i ./QAP_instance/tai100a.dat.dat\
                    -o ./QAP_result/ET5/100a_100_ET5_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 100\
                    -e 10000000\
                    -b 0.01\
                    -c 5 &


    # 100b
    # LLMST
    ./RankingEDAsCEC -i ./QAP_instance/tai100b.dat.dat\
                    -o ./QAP_result/LLMST99/100b_300_LLMST99_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m LLMST -d C -v 0\
                    -p 300\
                    -e 10000000\
                    -b 0.1 -n 99 &

    # GMC
    ./RankingEDAsCEC -i ./QAP_instance/tai100b.dat.dat\
                    -o ./QAP_result/GMC/100b_10_GMC_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m GM -d C -v 0\
                    -p 10\
                    -e 10000000 &

    # NO
    ./RankingEDAsCEC -i ./QAP_instance/tai100b.dat.dat\
                    -o ./QAP_result/NO/100b_1000_NO_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NO -d C -v 0\
                    -p 1000\
                    -e 10000000\
                    -b 0.0002 &

    # ET
    ./RankingEDAsCEC -i ./QAP_instance/tai100b.dat.dat\
                    -o ./QAP_result/ET5/100b_300_ET5_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 300\
                    -e 10000000\
                    -b 0.01\
                    -c 5 &


done
# repeat times end
wait