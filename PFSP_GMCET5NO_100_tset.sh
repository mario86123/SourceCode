#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
# ProblemSizeArray=("20" "40" "60")
ProblemSizeArray=("100")
Problem=("100_5" "100_10" "100_20")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
GMCET5_PopulationSizeArray=("1" "3" "5")
NO_PopulationSizeArray=("10" "20" "40")
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
      for ((problem = 0; problem < 3; problem++))
      do
      
          ./RankingEDAsCEC -i ./PFSP_instance/tai${Problem[$problem]}.txt\
                            -o ./PFSP_result/GMC/${Problem[$problem]}_"$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_GMC_"$times".txt\
                            -s "$times"\
                            -t PFSP\
                            -m GM -d C -v 0\
                            -p "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))" &
      done
      # problem end
      echo "end of problem = tai${Problem[$problem]}.txt, pop_size = "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = GMC"
      wait

      # ET5
      # Problem
      for ((problem = 0; problem < 3; problem++))
      do
          ./RankingEDAsCEC -i ./PFSP_instance/tai${Problem[$problem]}.txt\
                            -o ./PFSP_result/ET5/${Problem[$problem]}_"$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_ET5_"$times".txt\
                            -s "$times"\
                            -t PFSP\
                            -m ET -d C -v 0\
                            -p "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -c 5 -b 0.01 &
      done
      # problem end
      echo "end of problem = tai${Problem[$problem]}.txt, pop_size = "$((${GMCET5_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = ET5"
      wait

      # NO
      # Problem
      for ((problem = 0; problem < 3; problem++))
      do
          ./RankingEDAsCEC -i ./PFSP_instance/tai${Problem[$problem]}.txt\
                            -o ./PFSP_result/NO/${Problem[$problem]}_"$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_NO_"$times".txt\
                            -s "$times"\
                            -t PFSP\
                            -m NO -d U -v 0\
                            -p "$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.0002 &
      done
      # problem end
      echo "end of problem = tai${Problem[$problem]}.txt, pop_size = "$((${NO_PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", model = NO"
      wait
    done
    # repeat times end
  done
   # Population Size end
done
# ell end