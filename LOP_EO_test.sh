#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("75" "50" "44")
Problem=("sgb75.01" "be75eec" "t65b11xx" )
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
PopulationSizeArray=("5" "10" "20")
# PopulationSizeArray=("40" "20" "10" "5")
# PopulationSizeArray=("20" "40" "100")

# PreviousSampledReferenceCountArr=("10" "5" "2" "1")
# PreviousSampledReferenceCountArr=("1" "2" "5" "10")
# PreviousSampledReferenceCountArr=("1" "10")
# PreviousSampledReferenceCountArr=("1")


# ell
for ((ell = 0; ell < 3; ell++))
do

  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do
      # # repeat times
      for ((times = 0; times < 10; times++))
      do
          echo "problem = ${Problem[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = EO"

          ./RankingEDAsCEC -i ./LOP_instance/"${Problem[$ell]}"\
                            -o ./LOP_result/EO/"${Problem[$ell]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_EO_"$times".txt\
                            -s "$times"\
                            -t LOP\
                            -m EO -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.01
      done
      # repeat times end
  done
   # Population Size end
done
# ell end