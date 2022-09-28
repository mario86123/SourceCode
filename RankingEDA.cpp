/*
 *  RankingEDA.cpp
 *  RankingEDAsCEC
 *
 *  Created by Josu Ceberio Uribe on 9/15/11.
 *  Copyright 2011 University of the Basque Country. All rights reserved.
 *
 */

#include "RankingEDA.h"
#include "MallowsModel.h"
#include "Cayley.h"
#include "Kendall.h"
#include "GeneralizedMallowsModel.h"
#include "BWModel.h"
#include "MRModel.h"
#include "AMRModel.h"
#include "FMSTModel.h"
#include "LLMST.h"
#include "MSTModel.h"
#include "MSTME.h"
#include "EHBSAWO.h"
#include "EHBSAWT.h"
#include "NHBSAWO.h"
#include "NHBSAWT.h"
#include "MRWT.h"
#include "time.h"
/*
 * The constructor.
 */
RankingEDA::RankingEDA(PBP * problem, int problem_size, int poplation_size, long int max_evaluations, double b_ratio, double cut_point_count, int previous_sampled_reference_count, char* model_type, char* metric_type, int inverse, int seed)
{
    //1. standard initializations
    m_problem=problem;
    m_problem_size=problem_size;
    m_max_evaluations=max_evaluations;
    m_evaluations=0;
    m_convergence_evaluations=0;
    m_best= new CIndividual(problem_size);
    m_best->SetValue(MIN_LONG_INTEGER);
    // m_pop_size=m_problem_size*5;
    // m_sel_size=m_problem_size;
    
    // total population size = m_pop_size + m_offspring_size = 2 * m_sel_size
    m_pop_size = poplation_size;
    m_sel_size = m_pop_size;
    m_offspring_size = m_pop_size;

    memcpy(m_metric_type,metric_type,sizeof(char)*10);
    memcpy(m_model_type,model_type,sizeof(char)*10);
    
    m_inverse=inverse;
    
    //2. initialize the population
    
    // where is 0 ??
    // why add 35 at tail??
    // int tmp[35] = {20, 30, 18, 16, 12, 6, 25, 31, 11, 0, 15, 29, 32, 26, 23, 33, 28, 17, 7, 8, 21, 14, 9, 24, 4, 19, 34, 13, 27, 10, 3, 22, 2, 1, 5};
    // int tmp[35] = {29, 11, 15, 13, 23, 26, 33, 6, 12, 16, 18, 30, 20, 0, 34, 31, 19, 4, 24, 9, 14, 8, 21, 28, 32, 17, 7, 10, 3, 27, 22, 2, 1, 5, 25};
    // double tmp_fitness = m_problem->Evaluate(tmp);
    // cout <<"tmp fitness: "<< tmp_fitness << endl;
    
    // int tmp_1[36] = {34, 20, 30, 18, 16, 12, 6, 33, 35, 26, 28, 14, 9, 24, 4, 19, 31, 23, 13, 25, 15, 0, 11, 29, 32, 5, 2, 1, 22, 27, 3, 10, 7, 17, 8, 21};
    // double tmp_1_fitness = m_problem->Evaluate(tmp_1);
    // cout <<"tmp_1 fitness: "<< tmp_1_fitness << endl;

    m_population= new CPopulation(m_pop_size, m_offspring_size, m_problem_size);
    int * genes= new int[m_problem_size];
    for(int i=0; i<m_pop_size; i++)
	{
		//Create random individual
		GenerateRandomPermutation(genes,m_problem_size);
        if (m_inverse)
            m_population->SetToPopulation(genes, i, m_problem->EvaluateInv(genes));
        else
            m_population->SetToPopulation(genes, i, m_problem->Evaluate(genes));
        m_evaluations++;
    }
    
    m_population->SortPopulation(0);
    // cout<<""<<m_population->m_individuals[0]->Value()<<" , "<<m_evaluations<<" , "<<m_max_evaluations-m_evaluations<<endl;
    delete [] genes;
    

    //3. Build model structures
    if (((string)model_type)=="M"){
        m_model=new CMallowsModel(m_problem_size, m_sel_size, metric_type);
    }
    else if (((string)model_type)=="GM")
    {
        m_model=new CGeneralizedMallowsModel(m_problem_size, m_sel_size, metric_type);
    }
    else if (((string)model_type)=="BW")
    {
        m_model=new CBWModel(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="MR")
    {
        m_model=new CMRModel(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="AMR") // Accumulate MR Model
    {
        m_model=new CAMRModel(m_problem_size, m_sel_size, b_ratio, previous_sampled_reference_count, seed);
    }
    else if (((string)model_type)=="LLMST") // Loss Less MST Model
    {
        m_model=new CLLMST(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="FMST") // fast MST Model
    {
        m_model=new CFMSTModel(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="MST") // MST Model
    {
        m_model=new CMSTModel(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="MSTME") // MST Model with multiople edges
    {
        m_model=new CMSTME(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="EO") // EHBSA WO
    {
        m_model=new CEHBSAWO(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="ET") // EHBSA WT
    {
        m_model=new CEHBSAWT(m_problem_size, m_sel_size, b_ratio, cut_point_count);
    }
    else if (((string)model_type)=="NO") // NHBSA WO
    {
        m_model=new CNHBSAWO(m_problem_size, m_sel_size, b_ratio);
    }
    else if (((string)model_type)=="NT") // EHBSA WT
    {
        m_model=new CNHBSAWT(m_problem_size, m_sel_size, b_ratio, cut_point_count);
    }
    else if (((string)model_type)=="MRWT") // MRModel With Template
    {
        m_model=new CMRWT(m_problem_size, m_sel_size, b_ratio, cut_point_count);
    }
}

/*
 * The destructor. It frees the memory allocated..
 */
RankingEDA::~RankingEDA()
{
    // printf("m_pop_size: %d\n", m_pop_size);
    delete m_best;
    delete m_population;
    delete m_model;
}

/*
 * Running function
 */
int RankingEDA::Run(){
    
    //cout<<"Running..."<<endl;
    //variable initializations.
    int i;
    long int newScore;
    int * genes= new int[m_problem_size];
    int iterations=1;
    float rate=0.001;
    float population_avg_fitness = -100000000;

    // double * pop_entropy_arr = new double[ m_problem_size * m_problem_size / m_pop_size * 1000];

    //EDA iteration. Stopping criterion is the maximum number of evaluations performed
    //               or reach global optimal
    // while (m_evaluations<m_max_evaluations && newScore > population_avg_fitness) {
    // while ( m_evaluations<m_max_evaluations && !(m_population->Same(m_pop_size)) ){
    // while (m_evaluations<m_max_evaluations && population_avg_fitness < m_problem_size) {
    while (m_evaluations<m_max_evaluations) {        
        
        // time_t start, end;
        // start = clock();

        //learn model
        m_model->Learn(m_population, m_sel_size); // m_sel_size == m_pop_size

        // end = clock();
        // cout << "learn model time: " << start - end << endl;




        // printf("1: \n");
        // m_population->Print();

        // double tmp_entropy = m_population->CalculatePopulationEntropy();
        // printf("pop entropy: %lf\n", tmp_entropy);
        // pop_entropy_arr[iterations] = tmp_entropy;



        //sample the model.

        // edge model "without" template
        if (((string)m_model_type)=="EO" || \
            ((string)m_model_type)=="NO") {
            for (i=0;i< m_offspring_size && m_evaluations<m_max_evaluations;i++){
                
                // template == m_population->m_individuals[i]->Genes()
                m_model->Sample(genes);
                
                long new_sample_fitness = m_problem->Evaluate(genes);
                long template_fitness = m_population->m_individuals[i]->Value();

                // if template better than new sample
                if ( template_fitness > new_sample_fitness) {
                    m_population->AddToPopulation(genes, i, new_sample_fitness);
                }
                //if template worse than new sample
                else {
                    m_population->AddToPopulation(m_population->m_individuals[i]->Genes(), i, template_fitness);
                    m_population->SetToPopulation(genes, i, new_sample_fitness);
                }
                m_evaluations++;
            }
            // sort only population
            m_population->SortPopulation(0);
        }

        // models using template
        else if ( ((string)m_model_type)=="ET" || \
                  ((string)m_model_type)=="NT" || \
                  ((string)m_model_type)=="MRWT" || \
                  ((string)m_model_type)=="MRWFT") 
                  {
                    
            for (i=0;i< m_offspring_size && m_evaluations<m_max_evaluations;i++){
                
                // template == m_population->m_individuals[i]->Genes()
                m_model->Sample(genes, m_population->m_individuals[i]->Genes());
                
                long new_sample_fitness = m_problem->Evaluate(genes);
                long template_fitness = m_population->m_individuals[i]->Value();

                // printf("template: ");
                // PrintArray(m_population->m_individuals[i]->Genes(), m_problem_size);
                // printf("template fitness: %ld\n", template_fitness);

                // printf("new sample: ");
                // PrintArray(genes, m_problem_size);
                // printf("new sample fitness: %ld\n\n", new_sample_fitness);
                


                // if template better than new sample
                if ( template_fitness > new_sample_fitness) {
                    // printf("false !!\n");

                    m_population->AddToPopulation(genes, i, new_sample_fitness);
                }

                //if template worse than new sample
                else {
                    // printf("true !!\n");

                    m_population->AddToPopulation(m_population->m_individuals[i]->Genes(), i, template_fitness);
                    m_population->SetToPopulation(genes, i, new_sample_fitness);
                }
                m_evaluations++;
            }
            // sort only population
            m_population->SortPopulation(0);
        }

        else {

            // time_t start, end;
            // start = clock();
                
            for (i=0;i< m_offspring_size && m_evaluations<m_max_evaluations;i++){
                
                // time_t start, end;
                // start = clock();

                m_model->Sample(genes);
                
                // end = clock();
                // cout << "sample one chromosome time: " << start - end << endl;


                if (m_inverse)
                    m_population->AddToPopulation(genes, i, m_problem->EvaluateInv(genes));
                else
                    m_population->AddToPopulation(genes, i, m_problem->Evaluate(genes));
                m_evaluations++;
            }
            //update the model.

            // end = clock();
            // cout << "sample chromosome time: " << start - end << endl;
            
            // sort population and offspring together (elitism)
            m_population->SortPopulation(1);
            

        }

        // printf("3: \n");
        // m_population->RandomShuffle();
        // m_population->Print();


        //update indicators
        newScore=m_population->m_individuals[0]->Value();
        population_avg_fitness = m_population->AverageFitnessPopulation(m_pop_size);
        // printf("iteration: %d\n", iterations);


        // *** if all individuals in the population are the same
        // printf("m_real_converge_evaluations: %d\n", m_real_converge_evaluations);
        // // cannot do this !! converge NFE is not important ??
        // if ( m_population->Same(m_pop_size) ) {
        //     m_real_converge_evaluations = m_evaluations;
        //     printf("true m_real_converge_evaluations: %d\n", m_real_converge_evaluations);
        // }

        // *** if the best fitness equal to the population average fitness
        // if ( m_problem_size <= population_avg_fitness ) {
        //     m_real_converge_evaluations = m_evaluations;
        // }

        float modification=0;
        if (newScore>m_best->Value())
        {
            
            m_best->SetGenes(m_population->m_individuals[0]->Genes());
            m_best->SetValue(newScore);
            m_convergence_evaluations=m_evaluations;
          /* if (((string)m_model_type)=="M")
                cout<<""<<m_population->m_individuals[0]->Value()<<" , "<<m_evaluations<<" , "<<m_max_evaluations-m_evaluations<<"  Theta. "<<((CMallowsModel*)m_model)->m_distance_model->m_theta_parameter<<" lower: "<<((CMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound<<endl;

            else
                cout<<""<<m_population->m_individuals[0]->Value()<<" , "<<m_evaluations<<" , "<<m_max_evaluations-m_evaluations<<"  Thetas. "<<((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_theta_parameters[0]<<" lower: "<<((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound<<endl;
        */
           modification=-rate;
        }
        else{
            modification=rate;
        }

        // cout << "best: " <<m_best->Value() << endl;
        // cout << "avg: " <<population_avg_fitness << endl;
        
        if (((string)m_model_type)=="M"){
            ((CMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound= ((CMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound+modification;
            if (((CMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound<0.001)
                ((CMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound=0.001;
        }
        else if (((string)m_model_type)=="GM"){
            ((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound= ((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound+modification;
            if (((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound<0.001)
            ((CGeneralizedMallowsModel*)m_model)->m_distance_model->m_lower_theta_bound=0.001;
        }

        iterations++;

    }

    // --- write file ---//
    // ofstream output_file;
    // output_file.open("pop_entropy.txt");


    // for (int i = 0; i < m_problem_size * m_problem_size / m_pop_size * 1000; ++i) {
    //     output_file << pop_entropy_arr[i] << " ";
    // }
    // output_file << endl << endl;

    // output_file.close();
    // --- write file end ---//

    delete [] genes;
    // delete [] pop_entropy_arr;
    
    return 0;
}

/*
 * Returns the number of performed evaluations.
 */
int RankingEDA::GetPerformedEvaluations(){
    return m_convergence_evaluations;
}

int RankingEDA::GetRealConvergeNFE(){
    return m_real_converge_evaluations;
}
/*
 * Returns the fitness of the best solution obtained.
 */
long int RankingEDA::GetBestSolutionFitness(){
    return m_best->Value();
}

/*
 * Returns the best solution obtained.
 */
CIndividual * RankingEDA::GetBestSolution(){
    return m_best;
}


/*
 * This method applies a swap of the given i,j positions in the array.
 */
void RankingEDA::Swap(int * array, int i, int j)
{
	int aux=array[i];
	array[i]=array[j];
	array[j]=aux;
}

/*
 * Experiment for the Metric suitability for the different problems.
 */
void RankingEDA::MetricSuitability_Experiment(char * results_file){

    int tests=1000;
    int samples=1000;
    int * consensus= new int[m_problem_size];
    double thetas_K[10]={1.48,1.8,2.08,2.33,2.6,2.9,3.28,3.75,4.5,10};
    double thetas_C[10]={2.85,3.25,3.56,3.85,4.15,4.47,4.83,5.3,6.1,12};
    double thetas_U[10]={3.3,3.75,4.1,4.4,4.7,5.02,5.4,5.9,6.7,12};
    double theta=0;
    int distance_max_K=(m_problem_size-1)*m_problem_size/2;
    int distance_max_C=m_problem_size-1;
    int distance_max_U=m_problem_size-1;
    int distance=0;
    double fitness_variation=0;
    int fitness_differential=0;
    int distance_max;
    
    int * sample= new int[m_problem_size];
    double total_tests=0;
   // ofstream output_file;
   // output_file.open(results_file);
    for (int j=0;j<10;j++){
        
        if (((string)m_metric_type)=="K")
            theta=thetas_K[j];
        else if (((string)m_metric_type)=="C")
            theta=thetas_C[j];
        else
            theta=thetas_U[j];
        total_tests=0;
        for (int i=0;i<tests;i++){
            fitness_variation=0;
            GenerateRandomPermutation(consensus, m_problem_size);
            m_model->Learn(consensus, theta);
        
            for (int z=0;z<samples;z++){
                m_model->Sample(sample);
                
                //distance of the samples solution with respect to the consensus ranking.
                if (((string)m_metric_type)=="K"){
                    distance = Kendall(consensus,sample,m_problem_size);
                    distance_max=distance_max_K;
                }
                else if (((string)m_metric_type)=="C"){
                    distance = Cayley(consensus,sample,m_problem_size);
                    distance_max=distance_max_C;
                }
                else{
                    distance = Ulam(consensus,sample,m_problem_size);
                    distance_max=distance_max_U;
                }
                
                //fitness differential
                fitness_differential=abs(m_problem->EvaluateInv(sample)-m_problem->EvaluateInv(consensus));
                fitness_variation+=fitness_differential*(1-distance/distance_max);
            }
            fitness_variation=fitness_variation/samples;
            total_tests+=fitness_variation;
            //cout<<fitness_variation<<endl;
        }
        total_tests=total_tests/tests;
        cout<<total_tests<<endl;
    }
    cout<<"--------------------------------"<<endl;
 //   output_file.close();
    delete [] consensus;
    delete [] sample;
    
}