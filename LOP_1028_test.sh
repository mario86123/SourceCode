#!/bin/bash

# problem instance
for ((problem = 1; problem < 6; problem++))
do
    # # repeat times
    for ((times = 0; times < 10; times++))
    do
        # 1
        # LLMST
        ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/LLMST99/"$problem"_8000_LLMST99_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m LLMST -d C -v 0\
                        -p 8000\
                        -e 10000000\
                        -b 0.1 -n 99 &

        # GMC
        ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/GMC/"$problem"_10_GMC_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m GM -d C -v 0\
                        -p 10\
                        -e 10000000 &

        # NO
        ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/NO/"$problem"_500_NO_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m NO -d C -v 0\
                        -p 500\
                        -e 10000000\
                        -b 0.0002 &

        # ET
        ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/ET5/"$problem"_10_ET5_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m ET -d C -v 0\
                        -p 10\
                        -e 10000000\
                        -b 0.01\
                        -c 5 &

    done
    # repeat times end

done
# problem instance end