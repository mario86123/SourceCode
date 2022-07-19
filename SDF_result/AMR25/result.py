import numpy as np

class result:
    def __init__(self, best_fitness, best_solution, best_fitness_NFE, converge_NFE, time):
        self.best_fitness = best_fitness
        self.best_solution = best_solution
        self.best_fitness_NFE = best_fitness_NFE
        self.converge_NFE = converge_NFE
        self.time = time


repeat_time = 10
ell_lst = [20, 40, 60]
pop_size_lst = [2.5]



for ell in ell_lst:
    for pop_size in pop_size_lst:

        total_best_fitness = 0
        total_best_fitness_NFE = 0
        total_converge_NFE = 0            
        total_time = 0

        total_success_times = 0
        total_success_best_fitness_NFE = 0
        total_success_converge_NFE = 0

        fitness_lst = []

        for t in range(repeat_time):

            f = open(f'./{ell}_{int(ell * pop_size)}_AMR_{t}.txt', 'r')
            s = f.read().splitlines()

            best_fitness = float(s[0].split(": ")[1])
            best_solution = s[1].split(": ")[1]
            best_fitness_NFE = float(s[2].split(": ")[1])
            converge_NFE = float(s[3].split(": ")[1])
            time = float(s[4].split(": ")[1])
            
            fitness_lst.append(best_fitness)

            total_best_fitness += best_fitness
            total_best_fitness_NFE += best_fitness_NFE
            # total_converge_NFE += converge_NFE
            total_time += time
            
            if best_fitness == ell:
                total_success_times+=1
                total_success_best_fitness_NFE+=best_fitness_NFE
                total_success_converge_NFE+=converge_NFE

            
            # tmp = result(best_fitness, best_solution, NFE, time)
            # result_lst.append(tmp)

            f.close()


        # print result data
        print(f'ell: {ell}, population size: {ell * pop_size}, model = AMR:')
        print("avg_best_fitness: ", total_best_fitness/repeat_time)

        print("best fitness std: ", np.std(fitness_lst))

        print("avg_best_fitness_NFE: ", total_best_fitness_NFE/repeat_time)
        # print("avg_converge_NFE: ", total_converge_NFE/repeat_time)
        print("avg_time: ", total_time/repeat_time)

        if total_success_times is not 0:
            print("total_success_times: ", total_success_times)
            print("success_avg_best_fitness_NFE: ", total_success_best_fitness_NFE/total_success_times)
            print("success_avg_converge_NFE: ", total_success_converge_NFE/total_success_times)

        print()