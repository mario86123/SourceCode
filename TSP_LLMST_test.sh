#!/bin/bash

ProblemSizeArray=("76")
Problem=("pr76")
PopulationSizeArray=("20" "40" "80")
NumOfEdge=("75" "57" "38" "19")


# num of edge
for ((NOE = 0; NOE < 4; NOE++))
do

  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do
      # # repeat times
      for ((times = 0; times < 10; times++))
      do
          ./RankingEDAsCEC -i ./TSP_instance/"${Problem[$ell]}".tsp\
                            -o ./TSP_result/LLMST"$((${NumOfEdge[$NOE]}))"/"${Problem[$ell]}"_"$((${PopulationSizeArray[$pop]} * 76))"_LLMST"$((${NumOfEdge[$NOE]}))"_"$times".txt\
                            -s "$times"\
                            -t TSP\
                            -m LLMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * 76))"\
                            -e "$((76 * 76 * 1000))"\
                            -b 0.1 -n "$((${NumOfEdge[$NOE]}))"&
      done
      # repeat times end
  done
   # Population Size end
  echo "end of TSP, Emax = "$((76 * 76 * 1000))", model = LLMST"
  wait

done
# num of edge