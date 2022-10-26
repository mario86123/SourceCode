#!/bin/bash

ProblemSizeArray=("100")
Problem=("100_5" "100_10" "100_20")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
PopulationSizeArray=("1" "3" "5")
NumOfEdge=("99" "75" "50" "25")


# Population Size
for ((pop = 0; pop < 3; pop++))
do
  # num of edge
  for ((NOE = 0; NOE < 4; NOE++))
  do
    # # repeat times
    for ((times = 0; times < 10; times++))
    do
      # LLMST
      # Problem
      for ((problem = 0; problem < 3; problem++))
      do
      
          ./RankingEDAsCEC -i ./PFSP_instance/tai${Problem[$problem]}.txt\
                            -o ./PFSP_result/LLMST"$((${NumOfEdge[$NOE]}))"/${Problem[$problem]}_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_LLMST"$((${NumOfEdge[$NOE]}))"_"$times".txt\
                            -s "$times"\
                            -t PFSP\
                            -m LLMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e 10000000\
                            -b 0.1 -n "$((${NumOfEdge[$NOE]}))"&
      done
      # problem end
    done
    # repeat times end
  
  done
  # num of edge
  echo "end of pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", model = LLMST"
  wait

done
  # Population Size end