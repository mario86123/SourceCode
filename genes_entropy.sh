#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
ProblemSizeArray=("20" "40" "60")
# ProblemSizeArray=("60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
PopulationSizeArray=("5" "10" "20")
# PopulationSizeArray=("20" "40" "100")

# PreviousSampledReferenceCountArr=("10" "5" "2" "1")
# PreviousSampledReferenceCountArr=("1" "2" "5" "10")
# PreviousSampledReferenceCountArr=("1" "10")
PreviousSampledReferenceCountArr=("1")


# ell
for ((ell = 0; ell < 3; ell++))
do

  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do
      # # repeat times
      for ((times = 0; times < 10; times++))
      do
          echo "ell = ${ProblemSizeArray[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", PSRC = 1"

          ./RankingEDAsCEC -i ./SDF_instance/"${ProblemSizeArray[$ell]}".txt\
                            -o ./genes_entropy/result/"${ProblemSizeArray[$ell]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_1_AMR_"$times".txt\
                            -s "$times"\
                            -t SDF\
                            -m AMR -d C -v 0\
                            -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                            -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                            -b 0.1\
                            -r 1
      done
      # repeat times end


      # PSRC
      for ((PSRC = 0; PSRC < 1; PSRC++))
      do
          # repeat times
          for ((times = 0; times < 10; times++))
          do
            echo "ell = ${ProblemSizeArray[$ell]}, pop_size = "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))", times = ${times}, Emax = "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))", PSRC = "$((${ProblemSizeArray[$ell]} / ${PreviousSampledReferenceCountArr[$PSRC]}))""

            ./RankingEDAsCEC -i ./SDF_instance/"${ProblemSizeArray[$ell]}".txt\
                              -o ./genes_entropy/result/"${ProblemSizeArray[$ell]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_"$((${ProblemSizeArray[$ell]} / ${PreviousSampledReferenceCountArr[$PSRC]}))"_AMR_"$times".txt\
                              -s "$times"\
                              -t SDF\
                              -m AMR -d C -v 0\
                              -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"\
                              -e "$((${ProblemSizeArray[$ell]} * ${ProblemSizeArray[$ell]} * 1000))"\
                              -b 0.1\
                              -r "$((${ProblemSizeArray[$ell]} / ${PreviousSampledReferenceCountArr[$PSRC]}))"
          done
          # repeat times end


      done
      # PSRC end

  done
   # Population Size end


done
# ell end