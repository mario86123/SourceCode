#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("110")
# Problem=("A-n32-k5" "A-n45-k6" "A-n60-k9")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
PopulationSizeArray=( "5" "10" "20")
# PopulationSizeArray=("40" "20" "10" "5")
# PopulationSizeArray=("20" "40" "100")

# PreviousSampledReferenceCountArr=("10" "5" "2" "1")
# PreviousSampledReferenceCountArr=("1" "2" "5" "10")
# PreviousSampledReferenceCountArr=("1" "10")
# PreviousSampledReferenceCountArr=("1")


# ell
for ((ell = 0; ell < 1; ell++))
do

  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do

      echo "ell = ${ProblemSizeArray[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = MST"
      
      # # repeat times
      for ((times = 0; times < 10; times++))
      do
          ./RankingEDAsCEC -i ./VRP_instance/tai100a.vrp\
                            -o ./VRP_result/MST/"${ProblemSizeArray[$ell]}"a_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_MST_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m MST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 &

          ./RankingEDAsCEC -i ./VRP_instance/tai100b.vrp\
                            -o ./VRP_result/MST/"${ProblemSizeArray[$ell]}"b_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_MST_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m MST -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1 &
      done
      # repeat times end
      echo "end of ell = ${ProblemSizeArray[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = MST"
      wait
  done
   # Population Size end
done
# ell end