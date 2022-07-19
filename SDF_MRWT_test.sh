#!/bin/bash

ProblemSizeArray=("20" "40" "60")
PopulationSizeArray=("5" "10" "20")
Cut_point=("1" "2" "3" "4" "5")

# ell
for ((ell = 0; ell < 3; ell++))
do

  # pop_size
  for ((pop = 0; pop < 3; pop++))
  do

    
      
    # cut points
    for ((cp = 0; cp < 3; cp++))
    do
      # repeat times

      # MRWT
      for ((times = 0; times < 10; times++))
      do
        echo "ell = ${ProblemSizeArray[$ell]}, pop_size = $((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]})), times = ${times}, cut_point = ${Cut_point[$cp]}, model = MRWT"
        ./RankingEDAsCEC -i ./SDF_instance/"${ProblemSizeArray[$ell]}".txt -o ./SDF_result/MRWTTT/"${ProblemSizeArray[$ell]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_MRWT"${Cut_point[$cp]}"_"$times".txt -s "$times" -t SDF -m MRWT -d U -v 0 -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))" -e "$((${ProblemSizeArray[$i]} * ${ProblemSizeArray[$i]} * 1000))" -b 0.001 -c "${Cut_point[$cp]}"
      done
      

      # # MRWFT
      # for ((times = 0; times < 10; times++))
      # do
      #   echo "ell = ${ProblemSizeArray[$ell]}, pop_size = $((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]})), times = ${times}, cut_point = ${Cut_point[$cp]}, model = MRWFT"
      #   ./RankingEDAsCEC -i ./SDF_instance/"${ProblemSizeArray[$ell]}".txt -o ./SDF_result/"${ProblemSizeArray[$ell]}"_"$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))"_MRWFT"${Cut_point[$cp]}"_"$times".txt -s "$times" -t SDF -m MRWFT -d U -v 0 -p "$((${PopulationSizeArray[$pop]} * ${ProblemSizeArray[$ell]}))" -e "$((${ProblemSizeArray[$i]} * ${ProblemSizeArray[$i]} * 1000))" -b 0.001 -c "${Cut_point[$cp]}"
      # done
      # repeat times end
    
    done
    # cut points end
  done
  # pop_size end

done
# ell end