
def read_avg_fitness(problem, model, pop_size):
    
    summation = 0
    
    for t in range(10):
        f = open(f'./{model}/{problem}_{pop_size}_{model}_{t}.txt', 'r')
        s = f.read().splitlines()

        best_fitness = float(s[0].split(": ")[1])
        # best_fitness_NFE = float(s[2].split(": ")[1])

        summation += best_fitness


    return summation / 10; 

def read_arpd(problem, model, pop_size, opt):
    
    summation = 0
    
    for t in range(10):
        # print(f'./{model}/{problem}_{pop_size * ell}_{model}_{t}.txt')
        f = open(f'./{model}/{problem}_{pop_size}_{model}_{t}.txt', 'r')
        s = f.read().splitlines()

        best_fitness = float(s[0].split(": ")[1])
        # best_fitness_NFE = float(s[2].split(": ")[1])
        
        rpd = ((float(-best_fitness)) - (-opt)) / (-opt) * 100

        # print(rpd)
        summation += rpd


    return summation / 10; 



def read_avg_NFE(problem, model, pop_size):

    summation = 0
    
    for t in range(10):
        f = open(f'./{model}/{problem}_{pop_size}_{model}_{t}.txt', 'r')
        s = f.read().splitlines()

        # best_fitness = float(s[0].split(": ")[1])
        best_fitness_NFE = float(s[2].split(": ")[1])

        summation += best_fitness_NFE


    return summation / 10; 



problem_instance_lst = ["110a", "110b", "110c", "110d"]
# ell_lst = [20, 50]
opt_lst = [-2100, -2000, -1300, -1700] # according to EHBSA paper




pop_size_lst = [11, 33, 55, 110, 330, 550, 1100, 2200, 4400, 8800, 17600, 35200, 70400]
# pop_size_lst = [1, 3, 5, 10, 20, 40, 80, 160]
# other_pop_size_lst = [5, 10, 20]

model_lst = ["MST", "GMC", "ET5", "NO", "FMST"]
# model_lst = ["MST", "GMC", "MU", "ET5", "NO",]


print()
print(" [[[ ARPD lower, better ]]] ")
print()
print("            |  MST  |  GMC  |  ET5  |   NO  |  FMST |")
# print("            |  MST  |  GMC  |  ET5  |   NO  |")
# print("              |  MR  | MST | MSTME|  GMC |  MU  |  ET5 |")

for ell_count in range(len(problem_instance_lst)):
    
    print("------------------------------------------------------------------------------------------------")

    for pop_size_count in range(len(pop_size_lst)):

        print(f'{problem_instance_lst[ell_count]} |', end=" ")
        print(f'{(pop_size_lst[pop_size_count]):5} |', end=" ")

        for model_count in range(len(model_lst)):

            if (model_lst[model_count] == "MST" \
            and (pop_size_lst[pop_size_count] == 550 \
              or pop_size_lst[pop_size_count] == 1100 \
              or pop_size_lst[pop_size_count] == 2200 )) or \
                (model_lst[model_count] == "GMC" \
            and (pop_size_lst[pop_size_count] == 11  \
              or pop_size_lst[pop_size_count] == 33 \
              or pop_size_lst[pop_size_count] == 55 \
              or pop_size_lst[pop_size_count] == 110 \
              or pop_size_lst[pop_size_count] == 330 \
              or pop_size_lst[pop_size_count] == 550)) or \
                (model_lst[model_count] == "ET5" \
            and (pop_size_lst[pop_size_count] == 11  \
              or pop_size_lst[pop_size_count] == 33 \
              or pop_size_lst[pop_size_count] == 55 \
              or pop_size_lst[pop_size_count] == 110 \
              or pop_size_lst[pop_size_count] == 330 \
              or pop_size_lst[pop_size_count] == 550)) or \
                (model_lst[model_count] == "NO" \
            and (pop_size_lst[pop_size_count] == 55  \
              or pop_size_lst[pop_size_count] == 110 \
              or pop_size_lst[pop_size_count] == 330 \
              or pop_size_lst[pop_size_count] == 550 \
              or pop_size_lst[pop_size_count] == 1100 \
              or pop_size_lst[pop_size_count] == 2200)) or \
                (model_lst[model_count] == "FMST" \
            and (pop_size_lst[pop_size_count] == 1100 \
              or pop_size_lst[pop_size_count] == 2200 \
              or pop_size_lst[pop_size_count] == 4400 \
              or pop_size_lst[pop_size_count] == 8800 \
              or pop_size_lst[pop_size_count] == 17600 \
              or pop_size_lst[pop_size_count] == 35200 \
              or pop_size_lst[pop_size_count] == 70400)):
              
                print(f'{read_arpd(problem_instance_lst[ell_count] , model_lst[model_count], pop_size_lst[pop_size_count], opt_lst[ell_count]):5.1f} |', end=" ")
            
            else:
                print("      |", end=" ")









        print()

print("------------------------------------------------------------------------------------------------")
# read_avg_fitness(problem, model, ell, pop_size):

