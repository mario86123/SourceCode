#!/bin/bash

ProblemSizeArray=("100")
PopulationSizeArray=("10" "20" "40")
NumOfEdge=("100" "75" "50" "25")



# Population Size
for ((pop = 0; pop < 3; pop++))
do
  # num of edge
  for ((NOE = 0; NOE < 4; NOE++))
  do

    # Problem
    for ((problem = 1; problem < 6; problem++))
    do

      # # repeat times
      for ((times = 0; times < 10; times++))
      do
        
          ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                            -o ./LOP_result/LLMST"$((${NumOfEdge[$ell]}))"/"$problem"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_LLMST"$((${NumOfEdge[$ell]}))"_"$times".txt\
                            -s "$times"\
                            -t LOP\
                            -m LLMST -d U -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 -n "$((${NumOfEdge[$ell]}))"&
      done
      # repeat times end
    done
    # problem end

    echo "end of problem = ${ProblemSizeArray[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = LLMST"
    wait

  done
  # num of edge

done
  # Population Size end