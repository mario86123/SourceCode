#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("20" "40" "60")
# Problem=("gr24" "gr48" "pr76")
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
          echo "problem = tai"${ProblemSizeArray[$ell]}"a.dat.dat, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = ET5"

          ./RankingEDAsCEC -i ./QAP_instance/tai"${ProblemSizeArray[$ell]}"a.dat.dat\
                            -o ./QAP_result/ET5/"${ProblemSizeArray[$ell]}"a_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_ET5_"$times".txt\
                            -s "$times"\
                            -t QAP\
                            -m ET -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.01\
                            -c 5

          echo "problem = tai"${ProblemSizeArray[$ell]}"a.dat.dat, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = GMC"

          ./RankingEDAsCEC -i ./QAP_instance/tai"${ProblemSizeArray[$ell]}"a.dat.dat\
                            -o ./QAP_result/GMC/"${ProblemSizeArray[$ell]}"a_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_GMC_"$times".txt\
                            -s "$times"\
                            -t QAP\
                            -m GM -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"

      done
      # repeat times end
  done
   # Population Size end
done
# ell end