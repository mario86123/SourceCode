#!/bin/bash

ProblemSizeArray=("100")
Problem=("a" "b")
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
      for ((problem = 0; problem < 2; problem++))
      do
      
          ./RankingEDAsCEC -i ./QAP_instance/tai100${Problem[$problem]}.dat.dat\
                            -o ./QAP_result/LLMST"$((${NumOfEdge[$NOE]}))"/100"${Problem[$problem]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_LLMST"$((${NumOfEdge[$NOE]}))"_"$times".txt\
                            -s "$times"\
                            -t QAP\
                            -m LLMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 -n "$((${NumOfEdge[$NOE]}))"&
      done
      # problem end
    done
    # repeat times end
    echo "end of QAP, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = LLMST"
    wait
  done
# num of edge
done
# Population Size end
