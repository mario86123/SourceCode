#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("100")
# Problem=("t65b11xx" "be75eec" "sgb75.01")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
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
      for ((problem = 1; problem < 6; problem++))
      do
          ./RankingEDAsCEC -i ./LOP_instance/Cebe.lop.n100."$problem"\
                            -o ./LOP_result/FMST/"$problem"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_FMST_"$times".txt\
                            -s "$times"\
                            -t LOP\
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