#!/bin/bash

# ProblemSizeArray=("10" "15" "20" "25" "30" "35" "40" "45" "50")
# ProblemSizeArray=("6" "10" "20" "40" "60")
ProblemSizeArray=("20")
# ProblemSizeArray=("40" "60")
# PopulationSizeArray=("2" "3" "5" "10" "20")
# PopulationSizeArray=("5" "10" "20")
PopulationSizeArray=("20" "40" "100")
BRatio=("0.001")


# ell
for ((ell = 0; ell < 1; ell++))
do

  # Population Size
  for ((pop = 0; pop < 3; pop++))
  do

    # b_ratio
    for ((br = 0; br < 1; br++))
    do

      # repeat times
      for ((times = 0; times < 10; times++))
      do
        echo "ell = ${ProblemSizeArray[$i]}, pop_size = ${PopulationSizeArray[$pop]}, b_ratio = ${BRatio[$br]}, times = ${times}, Emax = "$((${ProblemSizeArray[$i]} * ${ProblemSizeArray[$i]} * 1000))""
        ./RankingEDAsCEC -i ./SDF_instance/"${ProblemSizeArray[$i]}".txt -o ./SDF_result/b_ratio/"${ProblemSizeArray[$i]}"_"${PopulationSizeArray[$pop]}"_"${BRatio[$br]}"_BW_"$times".txt -s "$times" -t SDF -m BW -d C -v 0 -p "${PopulationSizeArray[$pop]}" -e "$((${ProblemSizeArray[$i]} * ${ProblemSizeArray[$i]} * 1000))" -b "${BRatio[$br]}"
      done
      # repeat times end

    done
    # b_ratio end


  done
   # Population Size end


done
# ell end