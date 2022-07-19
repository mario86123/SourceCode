

class result:
    def __init__(self, best_fitness, best_solution, NFE, time):
        self.best_fitness = best_fitness
        self.best_solution = best_solution
        self.NFE = NFE
        self.time = time


repeat_time = 10
ell_lst = [6, 10, 20, 40, 60]
pop_size_lst = [5, 10, 20]



for ell in ell_lst:
    for pop_size in pop_size_lst:

        # for model in ["BW", "M"]:
            # result_lst = []

        total_best_fitness = 0
        total_NFE = 0
        total_time = 0

        total_success_times = 0
        total_success_NFE = 0

        for t in range(repeat_time):
            
            f = open(f'./{ell}_{ell * pop_size}_M_{t}.txt', 'r')
            s = f.read().splitlines()

            best_fitness = float(s[0].split(": ")[1])
            best_solution = s[1].split(": ")[1]
            NFE = float(s[2].split(": ")[1])
            time = float(s[3].split(": ")[1])
            
            total_best_fitness += best_fitness
            total_NFE += NFE
            total_time += time
            
            if best_fitness == ell:
                total_success_times+=1
                total_success_NFE+=NFE

            
            tmp = result(best_fitness, best_solution, NFE, time)
            # result_lst.append(tmp)

            f.close()


        # print result data
        print(f'ell: {ell}, population size: {ell * pop_size}, model = M:')
        print("avg_best_fitness: ", total_best_fitness/repeat_time)
        print("avg_NFE: ", total_NFE/repeat_time)
        print("avg_time: ", total_time/repeat_time)

        if total_success_times is not 0:
            print("total_success_times: ", total_success_times)
            print("success_avg_NFE: ", total_success_NFE/total_success_times)

        print()