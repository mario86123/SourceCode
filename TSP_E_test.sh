#!/bin/bash

ProblemSizeArray=("24" "48" "76")
ProblemInstance=("gr24" "gr48" "pr76")
Emax=("576000" "2304000" "5776000")
PopulationSizeArray=("60" "120" "240")
# PopulationSizeArray=("60" "120" "240" "480" "960")
B_ratio=("0.03" "0.015" "0.005")

Cut_point=("2" "3" "4" "5")

for ((ell = 0; ell < 3; ell++))
do


  # pop_size
  for ((pop = 0; pop < 3; pop++))
  do

    # repeat times
    for ((times = 0; times < 10; times++))
    do
      
      # EHBSAWO
      echo "ell = ${ProblemSizeArray[$ell]}, pop_size = ${PopulationSizeArray[$pop]}, times = ${times}, b_ratio = ${B_ratio[$ell]}"
      ./RankingEDAsCEC -i ./TSP_instance/"${ProblemInstance[$ell]}".tsp -o ./TSP_result/EO/"${ProblemInstance[$ell]}"_"$((${PopulationSizeArray[$pop]}))"_EO_"$times".txt -s "$times" -t TSP -m EO -d U -v 0 -p "$((${PopulationSizeArray[$pop]}))" -e "$((${Emax[$ell]}))" -b "${B_ratio[$ell]}"

      # EHBSAWT
      for ((cp = 0; cp < 4; cp++))
      do
        echo "ell = ${ProblemSizeArray[$ell]}, pop_size = ${PopulationSizeArray[$pop]}, times = ${times}, b_ratio = ${B_ratio[$ell]}, cut_point = ${Cut_point[$cp]}"
        ./RankingEDAsCEC -i ./TSP_instance/"${ProblemInstance[$ell]}".tsp -o ./TSP_result/ET"${Cut_point[$cp]}"/"${ProblemInstance[$ell]}"_"$((${PopulationSizeArray[$pop]}))"_ET"${Cut_point[$cp]}"_"$times".txt -s "$times" -t TSP -m ET -d U -v 0 -p "$((${PopulationSizeArray[$pop]}))" -e "$((${Emax[$ell]}))" -b "${B_ratio[$ell]}" -c "${Cut_point[$cp]}"
      done
      # EHBSAWT end
    
    done
    # repeat times end

  done
  # pop_size end

done