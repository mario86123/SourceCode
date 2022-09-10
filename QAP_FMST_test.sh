#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("100")
Problem=("a" "b")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
# FMSTET5_PopulationSizeArray=("1" "3" "5")
PopulationSizeArray=("10" "20" "40" "80" "160" "320" "640")
# PopulationSizeArray=("40" "20" "10" "5")
# PopulationSizeArray=("20" "40" "100")


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
      for ((problem = 0; problem < 2; problem++))
      do
      
          ./RankingEDAsCEC -i ./QAP_instance/tai100${Problem[$problem]}.dat.dat\
                            -o ./QAP_result/FMST/100${Problem[$problem]}_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_FMST_"$times".txt\
                            -s "$times"\
                            -t QAP\
                            -m FMST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 &
      done
      # problem end
    done
    # repeat times end
  done
   # Population Size end
  echo "end of QAP, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = FMST"
  wait

done
# ell end