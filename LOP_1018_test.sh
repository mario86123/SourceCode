#!/bin/bash

# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("100")
# Problem=("t65b11xx" "be75eec" "sgb75.01")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
# GMCET5_PopulationSizeArray=("1" "3" "5")
# NO_PopulationSizeArray=("5" "10" "20")
# MST_PopulationSizeArray=("5" "10" "20")
# PopulationSizeArray=("40" "20" "10" "5")
# PopulationSizeArray=("20" "40" "100")



# # repeat times
for ((times = 0; times < 10; times++))
do
  # GMC
  # Problem
  for ((problem = 1; problem < 6; problem++))
  do
      ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/GMC/"$problem"_10_GMC_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m GM -d C -v 0\
                        -p 10\
                        -e 10000000 &
  done
  # problem end
  echo "end of problem = $problem, model = GMC"
  # wait

  # ET5
  # Problem
  # for ((problem = 1; problem < 6; problem++))
  # do
  #     ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
  #                       -o ./LOP_result/ET5/"$problem"_10_ET5_"$times".txt\
  #                       -s "$times"\
  #                       -t LOP\
  #                       -m ET -d C -v 0\
  #                       -p 10\
  #                       -e 10000000\
  #                       -c 5 -b 0.01 &
  # done
  # # problem end
  # echo "end of problem = $problem, model = ET5"
  # wait

  # NO
  # Problem
  for ((problem = 1; problem < 6; problem++))
  do
      ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/NO/"$problem"_1000_NO_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m NO -d U -v 0\
                        -p 1000\
                        -e 10000000\
                        -b 0.0002 &
  done
  # problem end
  echo "end of problem = $problem, model = NO"
  # wait

  # MST
  # Problem
  for ((problem = 1; problem < 6; problem++))
  do
      ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                        -o ./LOP_result/MST/"$problem"_4000_MST_"$times".txt\
                        -s "$times"\
                        -t LOP\
                        -m MST -d U -v 0\
                        -p 4000\
                        -e 10000000\
                        -b 0.1 &
  done
  # problem end
  echo "end of problem = $problem, model = MST"

  wait
done
# repeat times end