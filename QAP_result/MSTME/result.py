

# class result:
#     def __init__(self, best_fitness, best_solution, best_fitness_NFE, converge_NFE, time):
#         self.best_fitness = best_fitness
#         self.best_solution = best_solution
#         self.best_fitness_NFE = best_fitness_NFE
#         self.converge_NFE = converge_NFE
#         self.time = time

repeat_time = 10

# problem_instance_lst = ["gr24", "gr48", "pr76"]
# ell_lst = [24, 48, 76]
problem_instance_lst = ["20a", "40a"]
ell_lst = [20, 40]

# opt = [-1272, -5046, -108159] # according to EHBSA paper
# opt = [-1272, -5046] # according to EHBSA paper

# pop_size_lst = [5, 10, 20, 40]
pop_size_lst = [10, 20, 40]

for i in range(len(problem_instance_lst)):
    for j in range(len(pop_size_lst)):

            # result_lst = []

            total_best_fitness = 0
            total_best_fitness_NFE = 0
            total_converge_NFE = 0            
            total_time = 0

            # total_success_times = 0
            # total_success_best_fitness_NFE = 0
            # total_success_converge_NFE = 0

            for t in range(repeat_time):
                
                # f = open(f'./{problem_instance_lst[i]}_{pop_size}_EO_{t}.txt', 'r')
                f = open(f'./{problem_instance_lst[i]}_{pop_size_lst[j] * ell_lst[i]}_MSTME_{t}.txt', 'r')
                s = f.read().splitlines()

                best_fitness = float(s[0].split(": ")[1])
                best_solution = s[1].split(": ")[1]
                best_fitness_NFE = float(s[2].split(": ")[1])
                converge_NFE = float(s[3].split(": ")[1])
                time = float(s[4].split(": ")[1])
                
                total_best_fitness += best_fitness
                total_best_fitness_NFE += best_fitness_NFE
                # total_converge_NFE += converge_NFE
                total_time += time
                
                # print(best_fitness)
                # if best_fitness >= opt[i]:
                #     total_success_times+=1
                #     total_success_best_fitness_NFE+=best_fitness_NFE
                #     total_success_converge_NFE+=converge_NFE

                
                # tmp = result(best_fitness, best_solution, NFE, time)
                # result_lst.append(tmp)

                f.close()


            # print result data
            print(f'problem: {problem_instance_lst[i]}, population size: {pop_size_lst[j] * ell_lst[i]}, model = MSTME:')
            print("avg_best_fitness: ", total_best_fitness/repeat_time)
            print("avg_best_fitness_NFE: ", total_best_fitness_NFE/repeat_time)
            # print("avg_converge_NFE: ", total_converge_NFE/repeat_time)
            print("avg_time: ", total_time/repeat_time)

            # if total_success_times is not 0:
            #     print("total_success_times: ", total_success_times)
            #     print("success_avg_best_fitness_NFE: ", total_success_best_fitness_NFE/total_success_times)
                # print("success_avg_converge_NFE: ", total_success_converge_NFE/total_success_times)

            print()
