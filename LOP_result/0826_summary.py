
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
        
        rpd = ((float(-best_fitness)) + opt) / (opt) * 100

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



problem_instance_lst = ["1", "2", "3", "4", "5"]
# ell_lst = [20, 50]
opt_lst = [370000, 500000, 800000, 950000, 850000] # according to EHBSA paper




pop_size_lst = [10, 30, 50, 100, 300, 500, 1000, 2000, 4000]
# pop_size_lst = [1, 3, 5, 10, 20, 40, 80, 160]
# other_pop_size_lst = [5, 10, 20]

model_lst = ["MST", "GMC", "ET5", "NO",]
# model_lst = ["MST", "GMC", "MU", "ET5", "NO",]


print()
print(" [[[ ARPD lower, better ]]] ")
print()
print("            |  MST  |  GMC  |  ET5  |   NO  |")
# print("            |  MST  |  GMC  |  ET5  |   NO  |")
# print("              |  MR  | MST | MSTME|  GMC |  MU  |  ET5 |")

for ell_count in range(len(problem_instance_lst)):
    
    print("------------------------------------------------------------------------------------------------")

    for pop_size_count in range(len(pop_size_lst)):

        print(f'{problem_instance_lst[ell_count]} |', end=" ")
        print(f'{(pop_size_lst[pop_size_count]):5} |', end=" ")

        for model_count in range(len(model_lst)):

            if (model_lst[model_count] == "MST" \
            and (pop_size_lst[pop_size_count] == 1000 \
              or pop_size_lst[pop_size_count] == 2000 \
              or pop_size_lst[pop_size_count] == 4000 )) or \
                (model_lst[model_count] == "GMC" \
            and (pop_size_lst[pop_size_count] == 10  \
              or pop_size_lst[pop_size_count] == 30 \
              or pop_size_lst[pop_size_count] == 50 \
              or pop_size_lst[pop_size_count] == 100 \
              or pop_size_lst[pop_size_count] == 300 \
              or pop_size_lst[pop_size_count] == 500)) or \
                (model_lst[model_count] == "ET5" \
            and (pop_size_lst[pop_size_count] == 10  \
              or pop_size_lst[pop_size_count] == 30 \
              or pop_size_lst[pop_size_count] == 50 \
              or pop_size_lst[pop_size_count] == 100 \
              or pop_size_lst[pop_size_count] == 300 \
              or pop_size_lst[pop_size_count] == 500)) or \
                (model_lst[model_count] == "NO" \
            and (pop_size_lst[pop_size_count] == 100  \
              or pop_size_lst[pop_size_count] == 300 \
              or pop_size_lst[pop_size_count] == 500 \
              or pop_size_lst[pop_size_count] == 1000 \
              or pop_size_lst[pop_size_count] == 2000 \
              or pop_size_lst[pop_size_count] == 4000)):
              
                print(f'{read_arpd(problem_instance_lst[ell_count] , model_lst[model_count], pop_size_lst[pop_size_count], opt_lst[ell_count]):5.1f} |', end=" ")
            
            else:
                print("      |", end=" ")









        print()

print("------------------------------------------------------------------------------------------------")
# read_avg_fitness(problem, model, ell, pop_size):

