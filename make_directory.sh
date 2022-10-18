#!/bin/bash

# SDF, TSP, QAP, PFSP, VRP, LOP
# GMC, NO, EO, LLMST

PROBLEM=("SDF" "TSP" "QAP" "PFSP" "VRP" "LOP")
MODEL=("GMC" "NO" "EO" "LLMST")

# echo ""${PROBLEM[1]}""
# ${Problem[$ell]}


for ((prob_num = 1; prob_num < 7; prob_num++))
do

    mkdir "${${PROBLEM[$prob_num]}}"_best_fitness
    mkdir "${${PROBLEM[$prob_num]}}"_avg_fitness

    for ((model_num = 1; model_num < 5; model_num++))
    do

        mkdir "${${PROBLEM[$prob_num]}}"_best_fitness/"${${MODEL[$model_num]}}"
        mkdir "${${PROBLEM[$prob_num]}}"_avg_fitness/"${${MODEL[$model_num]}}"

    done


done