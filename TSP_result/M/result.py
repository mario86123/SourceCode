

class result:
    def __init__(self, best_fitness, best_solution, NFE, time):
        self.best_fitness = best_fitness
        self.best_solution = best_solution
        self.NFE = NFE
        self.time = time


repeat_time = 10
problem_instance_lst = ["gr24", "gr48", "pr76"]
# ell_lst = [24, 48, 76]
pop_size_lst = [60, 120, 240, 480, 960]



for problem_instance in problem_instance_lst:
    for pop_size in pop_size_lst:

        # for model in ["BW", "M"]:
            # result_lst = []

        total_best_fitness = 0
        total_NFE = 0
        total_time = 0

        for t in range(repeat_time):
            
            f = open(f'./{problem_instance}_{pop_size}_M_{t}.txt', 'r')
            s = f.read().splitlines()

            best_fitness = float(s[0].split(": ")[1])
            best_solution = s[1].split(": ")[1]
            NFE = float(s[2].split(": ")[1])
            time = float(s[3].split(": ")[1])
            
            total_best_fitness += best_fitness
            total_NFE += NFE
            total_time += time

            
            tmp = result(best_fitness, best_solution, NFE, time)

            f.close()


        # print result data
        print(f'problem_instance: {problem_instance}, population size: {pop_size}, model = MR:')
        print("avg_best_fitness: ", total_best_fitness/repeat_time)
        print("avg_NFE: ", total_NFE/repeat_time)
        print("avg_time: ", total_time/repeat_time)
        print()