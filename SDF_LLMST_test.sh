#!/bin/bash

ProblemSizeArray=("60")
# PopulationSizeArray=("5" "10" "20" "40")
PopulationSizeArray=("160" "80" "40")
NumOfEdge=("59" "45" "30" "15")



# num of edge
for ((NOE = 0; NOE < 4; NOE++))
do


  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do
      # # repeat times
      for ((times = 0; times < 10; times++))
      do

          ./RankingEDAsCEC -i ./SDF_instance/60.txt\
                            -o ./SDF_result/LLMST"$((${NumOfEdge[$NOE]}))"/60_"$((${PopulationSizeArray[$pop]} * 60))"_LLMST"$((${NumOfEdge[$NOE]}))"_"$times".txt\
                            -s "$times"\
                            -t SDF\
                            -m LLMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * 60))"\
                            -e 3600000\
                            -b 0.1 -n "$((${NumOfEdge[$NOE]}))"&
      done
      # repeat times end
  done
   # Population Size end

   wait
done
# num of edge