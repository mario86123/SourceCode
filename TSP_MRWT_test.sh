#!/bin/bash

ProblemSizeArray=("24" "48" "76")
ProblemInstance=("gr24" "gr48" "pr76")
Emax=("576000" "2304000" "5776000")
PopulationSizeArray=("60" "120" "240" "480" "960" "1920")
# PopulationSizeArray=("60" "120" "240" "480" "960")
B_ratio=("1" "0.1" "0.01" "0.001" "0.0001")

Cut_point=("2" "3" "4" "5")

for ((ell = 0; ell < 3; ell++))
do


  # pop_size
  for ((pop = 0; pop < 6; pop++))
  do

    # B_ratio
    for ((b = 0; b < 5; b++))
    do

      # repeat times
      for ((times = 0; times < 10; times++))
      do
        
        # MR
        echo "ell = ${ProblemSizeArray[$ell]}, pop_size = ${PopulationSizeArray[$pop]}, times = ${times}, b_ratio = ${B_ratio[$b]}"
        ./RankingEDAsCEC -i ./TSP_instance/"${ProblemInstance[$ell]}".tsp -o ./TSP_result/MR/"${ProblemInstance[$ell]}"_"$((${PopulationSizeArray[$pop]}))"_"${B_ratio[$b]}"_MR_"$times".txt -s "$times" -t TSP -m MR -d U -v 0 -p "$((${PopulationSizeArray[$pop]}))" -e "$((${Emax[$ell]}))" -b "${B_ratio[$b]}"

        # MRWT
        for ((cp = 0; cp < 4; cp++))
        do
          echo "ell = ${ProblemSizeArray[$ell]}, pop_size = ${PopulationSizeArray[$pop]}, times = ${times}, b_ratio = ${B_ratio[$b]}, cut_point = ${Cut_point[$cp]}"
          ./RankingEDAsCEC -i ./TSP_instance/"${ProblemInstance[$ell]}".tsp -o ./TSP_result/MRWT"${Cut_point[$cp]}"/"${ProblemInstance[$ell]}"_"$((${PopulationSizeArray[$pop]}))"_"${B_ratio[$b]}"_MRWT"${Cut_point[$cp]}"_"$times".txt -s "$times" -t TSP -m MRWT -d U -v 0 -p "$((${PopulationSizeArray[$pop]}))" -e "$((${Emax[$ell]}))" -b "${B_ratio[$b]}" -c "${Cut_point[$cp]}"
        done
        # MRWT end
      
      done
      # repeat times end

    done
    # B_ratio end

  done
  # pop_size end

done