#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("110")
Problem=("a" "b" "c" "d")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
PopulationSizeArray=("10" "20" "40" "80" "160" "320" "640")



# ell
for ((ell = 0; ell < 1; ell++))
do

  # Population Size
  for ((pop = 0; pop < 7; pop++))
  do
  
    # # repeat times
    for ((times = 0; times < 10; times++))
    do
      # FMST
      # Problem
      for ((problem = 0; problem < 4; problem++))
      do
      
          ./RankingEDAsCEC -i ./VRP_instance/tai100${Problem[$problem]}.vrp\
                            -o ./VRP_result/FMST/110${Problem[$problem]}_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_FMST_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m FMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 &
      done
      # problem end
    done
    # repeat times end
    echo "end of pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = FMST"
    wait

  done
   # Population Size end
done
# ell end