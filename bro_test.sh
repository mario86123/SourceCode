#!/bin/bash



# TSP
# # repeat times
for ((times = 0; times < 10; times++))
do


    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/burma14.tsp\
                    -o ./TSP_result/NT3/burma14_28_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 28\
                    -e 560000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/burma14.tsp\
                    -o ./TSP_result/ET3/burma14_28_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 28\
                    -e 560000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/bayg29.tsp\
                    -o ./TSP_result/NT3/bayg29_58_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 58\
                    -e 1160000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/bayg29.tsp\
                    -o ./TSP_result/ET3/bayg29_58_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 58\
                    -e 1160000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    
    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/dantzig42.tsp\
                    -o ./TSP_result/NT3/dantzig42_84_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 84\
                    -e 1680000\
                    -b 0.00001\
                    -c 3 &


    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/dantzig42.tsp\
                    -o ./TSP_result/NT3/dantzig42_84_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 84\
                    -e 1680000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/eil51.tsp\
                    -o ./TSP_result/NT3/eil51_102_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 102\
                    -e 2040000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/eil51.tsp\
                    -o ./TSP_result/ET3/eil51_102_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 102\
                    -e 2040000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/berlin52.tsp\
                    -o ./TSP_result/NT3/berlin52_104_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 104\
                    -e 2080000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/berlin52.tsp\
                    -o ./TSP_result/ET3/berlin52_104_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 104\
                    -e 2080000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/eil76.tsp\
                    -o ./TSP_result/NT3/eil76_152_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 152\
                    -e 3040000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/eil76.tsp\
                    -o ./TSP_result/ET3/eil76_152_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 152\
                    -e 3040000\
                    -b 0.00001\
                    -c 3 &
    


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./TSP_instance/eil101.tsp\
                    -o ./TSP_result/NT3/eil101_202_NT3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m NT -d C -v 0\
                    -p 202\
                    -e 4040000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./TSP_instance/eil101.tsp\
                    -o ./TSP_result/ET3/eil101_202_ET3_"$times".txt\
                    -s "$times"\
                    -t TSP\
                    -m ET -d C -v 0\
                    -p 202\
                    -e 4040000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait





# QAP
# # repeat times
for ((times = 0; times < 10; times++))
do


    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/nug17.dat.dat\
                    -o ./QAP_result/NT3/nug17_34_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 34\
                    -e 680000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/nug17.dat.dat\
                    -o ./QAP_result/ET3/nug17_34_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 34\
                    -e 680000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/nug18.dat.dat\
                    -o ./QAP_result/NT3/nug18_36_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 36\
                    -e 720000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/nug18.dat.dat\
                    -o ./QAP_result/ET3/nug18_36_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 36\
                    -e 720000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    
    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/nug20.dat.dat\
                    -o ./QAP_result/NT3/nug20_40_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &


    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/nug20.dat.dat\
                    -o ./QAP_result/NT3/nug20_40_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/nug21.dat.dat\
                    -o ./QAP_result/NT3/nug21_42_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 42\
                    -e 840000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/nug21.dat.dat\
                    -o ./QAP_result/ET3/nug21_42_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 42\
                    -e 840000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/tai10a.dat.dat\
                    -o ./QAP_result/NT3/tai10a_20_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 20\
                    -e 400000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/tai10a.dat.dat\
                    -o ./QAP_result/ET3/tai10a_20_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 20\
                    -e 400000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/bur26a.dat.dat\
                    -o ./QAP_result/NT3/bur26a_52_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 52\
                    -e 1040000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/bur26a.dat.dat\
                    -o ./QAP_result/ET3/bur26a_52_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 52\
                    -e 1040000\
                    -b 0.00001\
                    -c 3 &
    


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./QAP_instance/bur26b.dat.dat\
                    -o ./QAP_result/NT3/bur26b_52_NT3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m NT -d C -v 0\
                    -p 52\
                    -e 1040000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./QAP_instance/bur26b.dat.dat\
                    -o ./QAP_result/ET3/bur26b_52_ET3_"$times".txt\
                    -s "$times"\
                    -t QAP\
                    -m ET -d C -v 0\
                    -p 52\
                    -e 1040000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait








# LOP
# # repeat times
for ((times = 0; times < 10; times++))
do


    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t65b11xx\
                    -o ./LOP_result/NT3/t65b11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t65b11xx\
                    -o ./LOP_result/ET3/t65b11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t65d11xx\
                    -o ./LOP_result/NT3/t65d11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t65d11xx\
                    -o ./LOP_result/ET3/t65d11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    
    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t65f11xx\
                    -o ./LOP_result/NT3/t65f11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &


    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t65f11xx\
                    -o ./LOP_result/NT3/t65f11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t65n11xx\
                    -o ./LOP_result/NT3/t65n11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t65n11xx\
                    -o ./LOP_result/ET3/t65n11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t65w11xx\
                    -o ./LOP_result/NT3/t65w11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t65w11xx\
                    -o ./LOP_result/ET3/t65w11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t69r11xx\
                    -o ./LOP_result/NT3/t69r11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t69r11xx\
                    -o ./LOP_result/ET3/t69r11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &
    


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./LOP_instance/t75i11xx\
                    -o ./LOP_result/NT3/t75i11xx_88_NT3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m NT -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./LOP_instance/t75i11xx\
                    -o ./LOP_result/ET3/t75i11xx_88_ET3_"$times".txt\
                    -s "$times"\
                    -t LOP\
                    -m ET -d C -v 0\
                    -p 88\
                    -e 1760000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait




# PFSP
# # repeat times
for ((times = 0; times < 10; times++))
do


    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai20_5_1\
                    -o ./PFSP_result/NT3/20_5_1_40_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai20_5_1\
                    -o ./PFSP_result/ET3/20_5_1_40_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai20_20_1\
                    -o ./PFSP_result/NT3/20_20_1_40_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai20_20_1\
                    -o ./PFSP_result/ET3/20_20_1_40_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 40\
                    -e 800000\
                    -b 0.00001\
                    -c 3 &

done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    
    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_5_1\
                    -o ./PFSP_result/NT3/50_5_1_100_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &


    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_5_1\
                    -o ./PFSP_result/NT3/50_5_1_100_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_10_1\
                    -o ./PFSP_result/NT3/50_10_1_100_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_10\
                    -o ./PFSP_result/ET3/50_10_100_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do
    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_20_1\
                    -o ./PFSP_result/NT3/50_20_1_100_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai50_20_1\
                    -o ./PFSP_result/ET3/50_20_1_100_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 100\
                    -e 2000000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_1\
                    -o ./PFSP_result/NT3/100_5_1_200_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 200\
                    -e 4000000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai100_5_1\
                    -o ./PFSP_result/ET3/100_5_1_200_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 200\
                    -e 4000000\
                    -b 0.00001\
                    -c 3 &
    


done
# repeat times end
wait


# # repeat times
for ((times = 0; times < 10; times++))
do

    # NT3
    ./RankingEDAsCEC -i ./PFSP_instance/tai100_10\
                    -o ./PFSP_result/NT3/100_10_200_NT3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m NT -d C -v 0\
                    -p 200\
                    -e 4000000\
                    -b 0.00001\
                    -c 3 &

    # ET3
    ./RankingEDAsCEC -i ./PFSP_instance/tai100_10\
                    -o ./PFSP_result/ET3/100_10_200_ET3_"$times".txt\
                    -s "$times"\
                    -t PFSP\
                    -m ET -d C -v 0\
                    -p 200\
                    -e 4000000\
                    -b 0.00001\
                    -c 3 &


done
# repeat times end
wait