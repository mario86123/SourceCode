#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("110")
Problem=("a" "b" "c" "d")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
GMCET5_PopulationSizeArray=("1" "3" "5")
NO_PopulationSizeArray=( "5" "10" "20")
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
  
    # # repeat times
    for ((times = 0; times < 10; times++))
    do
      # GMC
      # Problem
      for ((problem = 0; problem < 4; problem++))
      do
      
          ./RankingEDAsCEC -i ./VRP_instance/tai100${Problem[$problem]}.vrp\
                            -o ./VRP_result/GMC/110${Problem[$problem]}_"$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_GMC_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m GM -d C -v 0\
                            -p "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))" &
      done
      # problem end
      echo "end of problem = tai100${Problem[$problem]}.vrp, pop_size = "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = GMC"
      wait

      # ET5
      # Problem
      for ((problem = 0; problem < 4; problem++))
      do
          ./RankingEDAsCEC -i ./VRP_instance/tai100${Problem[$problem]}.vrp\
                            -o ./VRP_result/ET5/110${Problem[$problem]}_"$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_ET5_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m ET -d C -v 0\
                            -p "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -c 5 -b 0.01 &
      done
      # problem end
      echo "end of problem = tai100${Problem[$problem]}.vrp, pop_size = "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = ET5"
      wait

      # NO
      # Problem
      for ((problem = 0; problem < 4; problem++))
      do
          ./RankingEDAsCEC -i ./VRP_instance/tai100${Problem[$problem]}.vrp\
                            -o ./VRP_result/NO/110${Problem[$problem]}_"$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_NO_"$times".txt\
                            -s "$times"\
                            -t VRP\
                            -m NO -d U -v 0\
                            -p "$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.0002 &
      done
      # problem end
      echo "end of problem = tai100${Problem[$problem]}.vrp, pop_size = "$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = NO"
      wait
    done
    # repeat times end
  done
   # Population Size end
done
# ell end