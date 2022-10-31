#!/bin/bash


# problem instance
for ((problem = 1; problem < 11; problem++))
do
    # # repeat times
    for ((times = 0; times < 10; times++))
    do
        # 5
        # LLMST
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_"$problem".txt\
                        -o ./PFSP_result/LLMST99/tai100_5_"$problem"_300_LLMST99_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m LLMST -d C -v 0\
                        -p 300\
                        -e 10000000\
                        -b 0.1 -n 99 &

        # GMC
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_"$problem".txt\
                        -o ./PFSP_result/GMC/tai100_5_"$problem"_10_GMC_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m GM -d C -v 0\
                        -p 10\
                        -e 10000000 &

        # NO
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_"$problem".txt\
                        -o ./PFSP_result/NO/tai100_5_"$problem"_100_NO_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m NO -d C -v 0\
                        -p 100\
                        -e 10000000\
                        -b 0.0002 &

        # ET
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_"$problem".txt\
                        -o ./PFSP_result/ET5/tai100_5_"$problem"_30_ET5_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m ET -d C -v 0\
                        -p 30\
                        -e 10000000\
                        -b 0.01\
                        -c 5 &
        # 10
        # LLMST
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_10_"$problem".txt\
                        -o ./PFSP_result/LLMST99/tai100_10_"$problem"_300_LLMST99_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m LLMST -d C -v 0\
                        -p 300\
                        -e 10000000\
                        -b 0.1 -n 99 &

        # GMC
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_10_"$problem".txt\
                        -o ./PFSP_result/GMC/tai100_10_"$problem"_5_GMC_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m GM -d C -v 0\
                        -p 5\
                        -e 10000000 &

        # NO
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_10_"$problem".txt\
                        -o ./PFSP_result/NO/tai100_10_"$problem"_100_NO_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m NO -d C -v 0\
                        -p 100\
                        -e 10000000\
                        -b 0.0002 &

        # ET
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_10_"$problem".txt\
                        -o ./PFSP_result/ET5/tai100_10_"$problem"_30_ET5_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m ET -d C -v 0\
                        -p 30\
                        -e 10000000\
                        -b 0.01\
                        -c 5 &

        # 20
        # LLMST
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_20_"$problem".txt\
                        -o ./PFSP_result/LLMST99/tai100_20_"$problem"_2000_LLMST99_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m LLMST -d C -v 0\
                        -p 2000\
                        -e 10000000\
                        -b 0.1 -n 99 &

        # GMC
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_20_"$problem".txt\
                        -o ./PFSP_result/GMC/tai100_20_"$problem"_5_GMC_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m GM -d C -v 0\
                        -p 5\
                        -e 10000000 &

        # NO
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_20_"$problem".txt\
                        -o ./PFSP_result/NO/tai100_20_"$problem"_300_NO_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m NO -d C -v 0\
                        -p 300\
                        -e 10000000\
                        -b 0.0002 &

        # ET
        ./RankingEDAsCEC -i ./PFSP_instance/tai100_20_"$problem".txt\
                        -o ./PFSP_result/ET5/tai100_20_"$problem"_30_ET5_"$times".txt\
                        -s "$times"\
                        -t PFSP\
                        -m ET -d C -v 0\
                        -p 30\
                        -e 10000000\
                        -b 0.01\
                        -c 5 &
    done
    # repeat times end

done
# problem instance end