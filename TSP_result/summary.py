
def read_avg_fitness(problem, model, ell, pop_size):
    
    summation = 0
    
    for t in range(10):
        f = open(f'./{model}/{problem}_{pop_size * ell}_{model}_{t}.txt', 'r')
        s = f.read().splitlines()

        best_fitness = float(s[0].split(": ")[1])
        # best_fitness_NFE = float(s[2].split(": ")[1])

        summation += best_fitness


    return summation / 10; 

def read_arpd(problem, model, ell, pop_size, opt):
    
    summation = 0
    
    for t in range(10):
        f = open(f'./{model}/{problem}_{pop_size * ell}_{model}_{t}.txt', 'r')
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
        f = open(f'./{model}/{problem}_{pop_size * ell}_{model}_{t}.txt', 'r')
        s = f.read().splitlines()

        # best_fitness = float(s[0].split(": ")[1])
        best_fitness_NFE = float(s[2].split(": ")[1])

        summation += best_fitness_NFE


    return summation / 10; 



problem_instance_lst = ["gr24", "gr48", "pr76"]
ell_lst = [24, 48, 76]
opt_lst = [-1272, -5046, -108159] # according to EHBSA paper






pop_size_lst = [5, 10, 20, 40, 80, 160]
# other_pop_size_lst = [5, 10, 20]

model_lst = ["MR", "MST", "MSTME", "GMC", "MU"]
# model_lst = ["MR", "MST", "MSTME", "GMC", "MU", "ET5"]
MST_model_lst = ["MST", "MSTME"]

print()
print(" [[[ ARPD lower, better ]]] ")
print()
print("              |  MR  |  MST  | MSTME |  GMC  |   MU  |")
# print("              |  MR  | MST | MSTME|  GMC |  MU  |  ET5 |")

for ell_count in range(len(problem_instance_lst)):
    
    print("----------------------------------------------------------")

    for pop_size_count in range(len(pop_size_lst)):

        print(f'{problem_instance_lst[ell_count]} |', end=" ")
        print(f'{(ell_lst[ell_count] * pop_size_lst[pop_size_count]):5} |', end=" ")


        if pop_size_lst[pop_size_count] < 40:
            for model_count in range(len(model_lst)):
                print(f'{read_arpd(problem_instance_lst[ell_count] , model_lst[model_count], ell_lst[ell_count], pop_size_lst[pop_size_count], opt_lst[ell_count]):5.1f} |', end=" ")
        
        else:
            for model_count in range(len(model_lst)):
                if model_lst[model_count] in MST_model_lst:
                    print(f'{read_arpd(problem_instance_lst[ell_count] , model_lst[model_count], ell_lst[ell_count], pop_size_lst[pop_size_count], opt_lst[ell_count]):5.1f} |', end=" ")
                else:
                    print("      |", end=" ")


        print()

print("----------------------------------------------------------")
# read_avg_fitness(problem, model, ell, pop_size):
