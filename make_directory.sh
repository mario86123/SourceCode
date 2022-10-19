#!/bin/bash

# SDF, TSP, QAP, PFSP, VRP, LOP
# GMC, NO, EO, LLMST

# PROBLEM=("SDF" "TSP" "QAP" "PFSP" "VRP" "LOP")
# MODEL=("GMC" "NO" "EO" "LLMST")

PROBLEM=("SDF")
MODEL=("LLMST60" "LLMST45" "LLMST30" "LLMST15")

# echo ""${PROBLEM[1]}""
# ${Problem[$ell]}


# for ((prob_num = 1; prob_num < 2; prob_num++))
# do

# mkdir SDF_best_fitness
# mkdir SDF_avg_fitness

for ((model_num = 0; model_num < 4; model_num++))
do

    mkdir SDF_best_fitness/"${${MODEL[$model_num]}}"
    mkdir SDF_avg_fitness/"${${MODEL[$model_num]}}"

done

# done